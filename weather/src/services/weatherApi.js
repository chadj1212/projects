const API_KEY= 'bc2f3b39f6fd3171e9547a5e181f6f7a';
const BASE_URL='https://api.openweathermap.org/data/3.0'
const GEO_URL='https://api.openweathermap.org/geo/1.0'

export const getCurrentweather = async (city)=>{

    try{
        const response = await fetch (`${BASE_URL}/weather?q=${city}&appid=${API_KEY}&units=metric`);

        if(!response.ok){
            if(response.status=== 404){
                throw new Error(`city ${city} not found, please check the spelling and try again  `);
            }else if (response.status=== 401){
                throw new Error(`city ${city} invalid API KEY, please check your OpenWeatherMap API configuration`);
            }
        }else{
            throw new Error("weather service is temporarily unavailable. Please try again later ");
        }

        const data = await response.json();
        //to make sure we have the current timestamp if not provided
        if(!data.dt){
            data.dt = Math.floor(Date.now()/1000);
        }

        return data;
    }catch(error){
        if(error instanceof TypeError && error.message.includes("fetch")){
            throw new Error("Network error, please check your internet connection and try again");
        }
        throw error;

    }
};

export const getCurrentweatherByCoords = async (lat, lon )=>{

    try{
        const response = await fetch (`${BASE_URL}/weather?lat=${lat}&lon=${lon}&appid=${API_KEY}&units=metric`);

        if(!response.ok){
            if(response.status=== 401){
                throw new Error(`invalid API KEY, please check your OpenWeatherMap API configuration`);
            }
            
        }else{
            throw new Error("weather service is temporarily unavailable. Please try again later ");
        }

        const data = await response.json();
        //to make sure we have the current timestamp if not provided
        if(!data.dt){
            data.dt = Math.floor(Date.now()/1000);
        }

        return data;
    }catch(error){
        if(error instanceof TypeError && error.message.includes("fetch")){
            throw new Error("Network error, please check your internet connection and try again");
        }
        throw error;

    }
};

export const getWeatherForecast = async (city )=>{

    try{
        const response = await fetch (`${BASE_URL}/forecast?q=${city}&appid=${API_KEY}&units=metric`);

        if(!response.ok){
            if(response.status=== 404){
                throw new Error(`city ${city} not found, please check the spelling and try again  `);
            }else if (response.status=== 401){
                throw new Error(`city ${city} invalid API KEY, please check your OpenWeatherMap API configuration`);
            }
        }else{
            throw new Error("weather service is temporarily unavailable. Please try again later ");
        }


        return await response.json();
        

       
    }catch(error){
        if(error instanceof TypeError && error.message.includes("fetch")){
            throw new Error("Network error, please check your internet connection and try again");
        }
        throw error;

    }
};

export const searchCities = async (query )=>{

    try{
        const response = await fetch (`${GEO_URL}/direct?q=${query}&limit=5&appid=${API_KEY}`);

        if(!response.ok){
            if(response.status=== 401){
                throw new Error(`invalid API KEY, please check your OpenWeatherMap API configuration`);
            }
            
        }else{
            throw new Error("weather service is temporarily unavailable. Please try again later ");
        }

        
        const data = await response.json();

        // transform the geocoding api response to match our expceted format
        return data.map((city) =>({
            name: city.name,
            lat: city.lat,
            lon: city.lon,
            country: city.country,
            state: city.state || ""

        }));

       

    }catch(error){
        if(error instanceof TypeError && error.message.includes("fetch")){
            throw new Error("Network error, please check your internet connection and try again");
        }
        throw error;

    }
};