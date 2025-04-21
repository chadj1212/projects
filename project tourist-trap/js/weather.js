//for the search box
document.addEventListener('DOMContentLoaded', () => {
   



var searchValue = document.querySelector('#searchbox')
searchValue.addEventListener('keypress',setFunc);
function setFunc(e){
   
    if(e.keyCode == 13){
        getData(searchValue.value);
       
    }
}
        // to get the info from the api(api used from openweathermap)
function getData(value){ 
    fetch('https://api.openweathermap.org/data/2.5/weather?q='+value+'&appid=bc2f3b39f6fd3171e9547a5e181f6f7a&units=metric')
    .then(function(response){
        return response.json();
    })
    //what i used to get the specif info i need 
    .then(function(weather){
        document.querySelector('#city').innerHTML = weather.name;
        document.querySelector('#temp').innerHTML = weather.main.temp+" C. ";
        document.querySelector('#min_max_temp').innerHTML = 
        " Min. "+weather.main.temp_min+" / Max. "+weather.main.temp_max;
        document.querySelector('#weather').innerHTML = weather.weather[0].main;
        document.querySelector('#weather_desc').innerHTML = weather.weather[0].description;
        document.querySelector('#wind_dir_speed').innerHTML = "Wind direction:"+weather.wind.deg+"/ wind speed: " +weather.wind.speed+" meters a second";
    })
    .catch(function(err){
        console.log(err);
    });  
    
    
}


});