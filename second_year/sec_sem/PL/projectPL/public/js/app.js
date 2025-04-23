document.addEventListener('DOMContentLoaded', () => {
    // Controle de abas
    document.querySelectorAll('.tab-btn').forEach(btn => {
        btn.addEventListener('click', () => {
            document.querySelectorAll('.tab-btn, .tab-content').forEach(el => {
                el.classList.remove('active');
            });
            btn.classList.add('active');
            document.getElementById(btn.dataset.tab).classList.add('active');
        });
    });

    // Carrega dados iniciais
    loadData();
    
    // Event listeners
    document.getElementById('professor-form').addEventListener('submit', addProfessor);
    document.getElementById('generate-btn').addEventListener('click', generateSchedule);
    document.getElementById('reset-btn').addEventListener('click', resetSystem);
});

function loadData() {
    fetch('/api/professors')
        .then(response => response.json())
        .then(data => {
            const list = document.getElementById('professors-list');
            list.innerHTML = data.map(p => 
                `<div class="item">${p.id}: ${p.name} (${p.email})</div>`
            ).join('');
        });
}

function addProfessor(e) {
    e.preventDefault();
    const name = document.getElementById('prof-name').value;
    const email = document.getElementById('prof-email').value;
    
    fetch('/api/professors', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ name, email })
    }).then(() => {
        loadData();
        e.target.reset();
    });
}

function generateSchedule() {
    fetch('/api/schedule/generate', { method: 'POST' })
        .then(response => response.json())
        .then(data => {
            const result = document.getElementById('schedule-result');
            result.innerHTML = '<h3>Horário Gerado</h3>' + 
                data.schedule.map(c => 
                    `<div>${c.course} - ${c.professor} - Sala ${c.room}</div>`
                ).join('');
        });
}

function resetSystem() {
    fetch('/api/reset', { method: 'POST' })
        .then(() => location.reload());
}