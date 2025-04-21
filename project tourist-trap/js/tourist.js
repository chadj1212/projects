// modal settings

document.addEventListener('DOMContentLoaded', () => {
    const openModalImages = document.querySelectorAll('.open-modal-image');
    const closeModalButton = document.querySelector('.close-modal-button');
    const modalOverlay = document.querySelector('.modal-overlay');
    const modalContent = document.querySelector('.modal-content');

    openModalImages.forEach(image => {
        image.addEventListener('click', () => {
            modalContent.innerHTML = image.dataset.modalContent;
            modalOverlay.style.display = 'flex';
        });
    });

    closeModalButton.addEventListener('click', () => {
        modalOverlay.style.display = 'none';
    });

    // Close modal when clicking outside the modal content
    modalOverlay.addEventListener('click', (e) => {
        if (e.target === modalOverlay) {
            modalOverlay.style.display = 'none';
        }
    });
  });  


// animation js
  document.addEventListener('DOMContentLoaded', () => {
    const elements = document.querySelectorAll('.text-box, .image-box, .card-a, .content-box-b, .slide, .slide2, .text-box-down, .image-box-b,.slide3');

    const observer = new IntersectionObserver((entries) => {
        entries.forEach(entry => {
            if (entry.isIntersecting) {
                entry.target.classList.add('visible');
            }
        });
    }, {
        threshold: 0.1
    });

    elements.forEach(element => {
        observer.observe(element);
    });
});



// side nav bar

function openNav() {
    document.getElementById("mySidenav").style.width = "250px";
  }
  
  function closeNav() {
    document.getElementById("mySidenav").style.width = "0";
  }







  document.addEventListener('DOMContentLoaded', () => {
    // Function to fetch weather data for Curaçao
    function getData() {
        fetch('https://api.openweathermap.org/data/2.5/weather?q=Curacao&appid=bc2f3b39f6fd3171e9547a5e181f6f7a&units=metric')
            .then(response => response.json())
            .then(weather => {
                // Update the HTML with weather information
                document.querySelector('#city').innerHTML = weather.name;
                document.querySelector('#temp').innerHTML = weather.main.temp + "°C";
                document.querySelector('#min_max_temp').innerHTML = 
                    "Min: " + weather.main.temp_min + "°C / Max: " + weather.main.temp_max + "°C";
                document.querySelector('#weather').innerHTML = weather.weather[0].main;
                document.querySelector('#weather_desc').innerHTML = weather.weather[0].description;
                document.querySelector('#wind_dir_speed').innerHTML = 
                    "Wind Direction: " + weather.wind.deg + "° / Wind Speed: " + weather.wind.speed + " m/s";

                // Check if it's raining and display a message
                if (weather.weather.some(condition => condition.main.toLowerCase() === 'rain')) {
                    document.querySelector('#rain_status').innerHTML = "It is currently raining.";
                } else {
                    document.querySelector('#rain_status').innerHTML = "It is not raining.";
                }
            })
            .catch(err => {
                console.error("Error fetching weather data: ", err);
            });
    }

    // Call the function to fetch weather data for Curaçao
    getData();
});








  
