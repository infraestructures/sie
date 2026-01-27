(function () {
    const searchInput = document.getElementById('empresa_search');
    const resultsBox = document.getElementById('empresa_results');
    const hiddenId = document.getElementById('empresa_id');
    const selBox = document.getElementById('empresa_seleccionada');

    const btnNova = document.getElementById('btn_nova_empresa');
    const boxNova = document.getElementById('nova_empresa_box');
    const btnCancel = document.getElementById('btn_cancelar_nova_empresa');
    const btnSaveNova = document.getElementById('btn_guardar_nova_empresa');
    const msgNova = document.getElementById('nova_empresa_msg');
    const btnNeteja = document.getElementById('btn_neteja_empresa');

    let timer = null;
    // Desplegables Illa / Municipi dins "Nova empresa"
    const novaIllaSel = document.getElementById('nova_illa_id');
    const novaMunicipiSel = document.getElementById('nova_municipi_id');

    function renderMunicipisForIlla(illaId) {
        if (!novaMunicipiSel) return;

        const all = Array.isArray(window.__MUNICIPIS_ALL) ? window.__MUNICIPIS_ALL : [];
        const list = all.filter(m => String(m.illa_id) === String(illaId));

        novaMunicipiSel.innerHTML = '<option value="">Selecciona un municipi</option>';
        list.forEach(m => {
            const opt = document.createElement('option');
            opt.value = m.id;
            opt.textContent = m.nom;
            novaMunicipiSel.appendChild(opt);
        });

        novaMunicipiSel.disabled = !illaId;
    }

    if (novaIllaSel && novaMunicipiSel) {
        novaIllaSel.addEventListener('change', () => {
            renderMunicipisForIlla(novaIllaSel.value);
        });
        // estat inicial
        renderMunicipisForIlla(novaIllaSel.value);
    }

    function escapeHtml(s) {
        return (s ?? '').toString()
            .replaceAll('&', '&amp;')
            .replaceAll('<', '&lt;')
            .replaceAll('>', '&gt;')
            .replaceAll('"', '&quot;')
            .replaceAll("'", "&#039;");
    }

    function clearResults() {
        resultsBox.innerHTML = '';
        resultsBox.style.display = 'none';
    }

    function setSelectedEmpresa(empresa) {
        hiddenId.value = empresa.id;
        selBox.style.display = 'block';
        selBox.innerHTML = `
    <strong>Empresa seleccionada:</strong> ${escapeHtml(empresa.nom)}
    <div class="empresa-meta">
        CIF: ${escapeHtml(empresa.cif || '')}
        ${empresa.municipi_id ? ' � Municipi ID: ' + escapeHtml(empresa.municipi_id) : ''}
    </div>
    `;
        clearResults();
    }

    async function searchEmpreses(q) {
        const url = 'empresaSearch.php?q=' + encodeURIComponent(q);
        const res = await fetch(url, { headers: { 'Accept': 'application/json' } });
        if (!res.ok) throw new Error('Error cercant empreses');
        return await res.json();
    }

    function renderResults(list) {
        if (!Array.isArray(list) || list.length === 0) {
            resultsBox.innerHTML = `
        <div class="empresa-item">
          <div>
            <div><strong>Cap resultat</strong></div>
            <div class="empresa-meta">Pots crear una nova empresa amb �+ Nova empresa�.</div>
          </div>
        </div>`;
            resultsBox.style.display = 'block';
            return;
        }

        resultsBox.innerHTML = list.map(e => `
    <div class="empresa-item">
        <div>
            <div><strong>${escapeHtml(e.nom)}</strong></div>
            <div class="empresa-meta">
                CIF: ${escapeHtml(e.cif || '')}
                ${e.municipi_id ? ' � Municipi ID: ' + escapeHtml(e.municipi_id) : ''}
            </div>
        </div>
        <div>
            <button type="button" class="btn btn-sm btn-primary" data-empresa='${escapeHtml(JSON.stringify(e))}'>
                Seleccionar
            </button>
        </div>
    </div>
    `).join('');
        resultsBox.style.display = 'block';

        // Bind buttons
        resultsBox.querySelectorAll('button[data-empresa]').forEach(btn => {
            btn.addEventListener('click', () => {
                const empresa = JSON.parse(btn.getAttribute('data-empresa'));
                setSelectedEmpresa(empresa);
            });
        });
    }

    // Cerca amb debounce
    searchInput.addEventListener('input', () => {
        const q = searchInput.value.trim();
        hiddenId.value = ''; // si est� escrivint de nou, deseleccionem fins que tri�
        selBox.style.display = 'none';

        if (timer) clearTimeout(timer);
        if (q.length < 2) { clearResults(); return; }

        timer = setTimeout(async () => {
            try {
                const list = await searchEmpreses(q);
                renderResults(list);
            } catch (e) {
                resultsBox.innerHTML = `<div class="empresa-item"><div><strong>Error</strong><div class="empresa-meta">${escapeHtml(e.message)}</div></div></div>`;
                resultsBox.style.display = 'block';
            }
        }, 250);
    });

    // Neteja selecci�
    btnNeteja.addEventListener('click', () => {
        searchInput.value = '';
        hiddenId.value = '';
        selBox.style.display = 'none';
        clearResults();
    });

    // Mostrar/Amagar caixa nova empresa
    btnNova.addEventListener('click', () => {
        boxNova.style.display = (boxNova.style.display === 'none' ? 'block' : 'none');
        msgNova.style.display = 'none';
        msgNova.innerHTML = '';
    });

    btnCancel.addEventListener('click', () => {
        boxNova.style.display = 'none';
        msgNova.style.display = 'none';
        msgNova.innerHTML = '';
    });

    async function createEmpresa(payload) {
        const res = await fetch('empresaCreate.php', {
            method: 'POST',
            headers: { 'Content-Type': 'application/json', 'Accept': 'application/json' },
            body: JSON.stringify(payload)
        });
        const data = await res.json().catch(() => ({}));
        if (!res.ok || !data || data.ok !== true) {
            throw new Error(data && data.error ? data.error : 'Error creant empresa');
        }
        return data.empresa;
    }

    // Guardar nova empresa
    btnSaveNova.addEventListener('click', async () => {
        msgNova.style.display = 'none';
        msgNova.innerHTML = '';

        const payload = {
            nom: document.getElementById('nova_nom').value.trim(),
            cif: document.getElementById('nova_cif').value.trim(),
            adreca: document.getElementById('nova_adreca').value.trim(),
            codi_postal: document.getElementById('nova_codi_postal').value.trim(),
            municipi_id: document.getElementById('nova_municipi_id').value.trim(),
            telefon: document.getElementById('nova_telefon').value.trim(),
            email: document.getElementById('nova_email').value.trim(),
            persona_contacte: document.getElementById('nova_persona_contacte').value.trim(),
            observacions: document.getElementById('nova_observacions').value.trim()
        };

        if (!payload.nom) {
            msgNova.style.display = 'block';
            msgNova.className = 'alert alert-warning';
            msgNova.innerHTML = 'El camp <strong>Nom</strong> �s obligatori.';
            return;
        }

        try {
            btnSaveNova.disabled = true;
            const empresa = await createEmpresa(payload);

            // Selecciona autom�ticament la nova empresa
            setSelectedEmpresa(empresa);

            // Opcional: posa el nom al cercador
            searchInput.value = empresa.nom;

            // Tanca
            boxNova.style.display = 'none';

        } catch (e) {
            msgNova.style.display = 'block';
            msgNova.className = 'alert alert-danger';
            msgNova.innerHTML = escapeHtml(e.message);
        } finally {
            btnSaveNova.disabled = false;
        }
    });

    // Oculta resultats si cliques fora
    document.addEventListener('click', (ev) => {
        if (!resultsBox.contains(ev.target) && ev.target !== searchInput) {
            clearResults();
        }
    });

})();