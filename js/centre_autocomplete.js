document.addEventListener('DOMContentLoaded', function () {
    const input = document.getElementById('centre_txt');
    const hidden = document.getElementById('centre_id');
    const box = document.getElementById('centre_suggest');

    console.log('[centre-autocomplete] loaded', { input, hidden, box });

    if (!input || !hidden || !box) return;

    let timer = null;
    let lastQuery = '';

    function hideBox() {
        box.style.display = 'none';
        box.innerHTML = '';
    }

    function render(items) {
        box.innerHTML = '';
        if (!items.length) {
            box.innerHTML = '<div style="padding:8px;color:#666;">Sense resultats</div>';
            box.style.display = 'block';
            return;
        }

        items.forEach(it => {
            const div = document.createElement('div');
            div.textContent = it.nom;
            div.style.padding = '8px';
            div.style.cursor = 'pointer';
            div.style.borderBottom = '1px solid #eee';

            div.addEventListener('mousedown', e => {
                e.preventDefault();
                input.value = it.nom;
                hidden.value = it.id;
                hideBox();
            });

            box.appendChild(div);
        });

        box.style.display = 'block';
    }

    async function fetchCentres(q) {
        const r = await fetch('ajax_centres.php?q=' + encodeURIComponent(q));
        const data = await r.json();
        render(data);
    }

    input.addEventListener('input', () => {
        const q = input.value.trim();
        hidden.value = '';

        if (timer) clearTimeout(timer);
        if (q.length < 2) { hideBox(); return; }

        timer = setTimeout(() => {
            if (q === lastQuery) return;
            lastQuery = q;
            fetchCentres(q);
        }, 200);
    });

    document.addEventListener('click', e => {
        if (!box.contains(e.target) && e.target !== input) hideBox();
    });
});
