document.getElementById('buttonCall').addEventListener('click', () => {
    const pokemonName = document.getElementById('pokemonName').value.toLowerCase().trim();
    if (pokemonName) {
        fetchPokemonStats(pokemonName);
    }
});

async function fetchPokemonStats(name) {
    const statsContainer = document.getElementById('stats-container');
    statsContainer.innerHTML = ''; // Clear previous stats

    try {
        const response = await fetch(`https://pokeapi.co/api/v2/pokemon/${name}`);
        if (!response.ok) {
            throw new Error('Pokémon not found');
        }

        const data = await response.json();
        displayStats(data.stats);
    } catch (error) {
        statsContainer.innerHTML = `<p style="color:red;">${error.message}</p>`;
    }
}

function displayStats(stats) {
    const statsContainer = document.getElementById('stats-container');
    stats.forEach(stat => {
        const statElement = document.createElement('div');
        statElement.classList.add('stat');
        statElement.innerHTML = `<strong>${stat.stat.name.toUpperCase()}:</strong> ${stat.base_stat}`;
        statsContainer.appendChild(statElement);
    });
}