import { useEffect, useState } from "react";
import { 
    getCurrentweather,
    getCurrentweatherByCoords,
    getWeatherForecast } from "../services/weatherApi";

    export const useWeather = ()=>{
        const[currentWeather, setCurrentWeather] = useState(null);
        const[forcast, setForCast] = useState(null);
        const[loading, setLoading] = useState(false);
        const[error, setError] = useState(null);
        const[unit, setUnit] = useState("C");

        const fetchWeatherByCity = async (city)=>{
            setLoading(true);
            setError(null);
            try{
                const[weatherData, foreCast] = await Promise.all([
                    getCurrentweather(city),
                    getWeatherForecast(city)
                ])

                setCurrentWeather(weatherData);
                setForcast(foreCast)
            }catch(err){
                setError(err instanceof Error ? err.message : "failed to fetch weather data")
            }
            finally{
                setLoading(false);
            }
        };

        const fetchWeatherByLocation = async ()=>{
            if(!navigator.geolocation){
            setError("GeoLocation is not supported by this browser")
        }
        setLoading(true);
        setError(null); 
        
        navigator.geolocation.getCurrentPosition(async(position)=>{
            try{
                const{ latitude, longitude} = position.coords;
                const weatherData = await getCurrentweatherByCoords(latitude, longitude);
                setCurrentWeather(weatherData);

                //also fetch forecast for the current location
                const forcastData = await getWeatherForecast(weatherData.name);
                setForCast(forcastData)
            }catch(err){
                setError(
                    err instanceof Error ? err.message : "failed to fetch weather data"
                );

            }
            finally{
                setLoading(false);
            }
        },(error)=>{
            setError("unable to retrieve your location")
        }

    );
    };
    const toggleUnit = () =>{
        setUnit( unit === "C" ? "F": "C");
    }
    //load default weather on mount
    useEffect(()=>{
        fetchWeatherByCity("New York");
    });
    return { currentWeather, forcast, loading, error, unit, fetchWeatherByCity, fetchWeatherByLocation, toggleUnit, }
};



