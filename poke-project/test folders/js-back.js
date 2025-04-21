fetchData();

// is used to fetch pokemon data
async function fetchData() {
    
    try{

        const pokemonName = document.getElementById("pokemonName").value.toLowerCase();
        // is used to fetch pokemon data
        const response = await fetch(`https://pokeapi.co/api/v2/pokemon/${pokemonName}`);
        // is used to display error if data not found
        if(!response.ok){
            throw new Error("could not fetch resource")
        }
// experimentall
        const responses = await fetch(`https://pokeapi.co/api/v2/pokemon-species/${pokemonName}`);
        // is used to display error if data not found
        if(!responses.ok){
            throw new Error("could not fetch resource")
        }

        const data2 = await responses.json();
        console.log(data2);





       // console.log(data2.flavor_text_entries);

       //const pokeDisc = data2.flavor_text_entries.map(flavor_text=>{
       // console.log(flavor_text.flavor_text)
        //return flavor_text.flavor_text



      // });
//const textDisc = document.getElementById("pokeDisc");
      // textDisc.innerHTML= pokeDisc;


        // till here
        // is used to fetch data and display in in the console
        const data = await response.json();
        console.log(data);
        const pokemonSprite = data.sprites.front_default;
        const imgElement = document.getElementById("pokemonSprite");
        imgElement.src = pokemonSprite;
        imgElement.style.display = "block"
        // is used to fetch the pokemon name and display it
        const pokeName =data.name;
        const text = document.getElementById("pokemon");
        text.innerHTML =pokeName;
        //document.getElementById("pokemon").textContent = data.name;


        //this gets the pokemon type
        const pokeTypes = data.types.map(type =>{
            console.log(type.type.name)
            return type.type.name
        }) ;
        const textType = document.getElementById("pokeType");
        textType.innerHTML= pokeTypes;
        console.log(data.name)
        console.log(data.stats);
        console.log(data.types);

        

        

        

// the stats
        const pokeStats = data.stats.map(base_stat=>{
            console.log(base_stat.base_stat)
            return base_stat.base_stat
        });
        const textStat = document.getElementById("pokeStats");
        textStat.innerHTML= pokeStats;
       
 
        const hpData = data.stats.find(stat => stat.stat.name === "attack");
        console.log(hpData.base_stat)
        const hpStat=hpData.base_stat;

        const textHp=document.getElementById("pokeHp");
        textHp.innerHTML =hpStat;


// the weight
const pokeWeight = data.weight;
const textWeight = document.getElementById("pokeWeight");
textWeight.innerHTML= pokeWeight;

// the height
const pokeHeight = data.height;
const textHeight = document.getElementById("pokeHeight");
textHeight.innerHTML= pokeHeight;

// the ID
const pokeID = data.id;
const textID = document.getElementById("pokeID");
textID.innerHTML= pokeID;



        

    }
    catch(error){
        console.error(error);
    }

 
    const pokemonName1 = document.getElementById("pokemonName").value.toLowerCase();
    const flavorTextDiv = document.getElementById("flavorText");
    flavorTextDiv.innerHTML = "";

    try {
        const response = await fetch(`https://pokeapi.co/api/v2/pokemon-species/${pokemonName1}`);
        if (!response.ok) throw new Error("Pokémon not found. Please check the name.");

        const data = await response.json();
        const englishEntry = data.flavor_text_entries.find(entry => entry.language.name === "en");

        if (!englishEntry) {
            flavorTextDiv.innerHTML = "No English flavor text found for this Pokémon.";
            return;
        }

        const p = document.createElement("p");
        p.textContent = englishEntry.flavor_text.replace(/\n|\f/g, " ");
        flavorTextDiv.appendChild(p);
    } catch (error) {
        flavorTextDiv.innerHTML = `<p style="color: red;">${error.message}</p>`;
    }
    
    
}




    

let slideIndex = 1;
showSlides(slideIndex);

function plusSlides(n) {
  showSlides(slideIndex += n);
}

function currentSlide(n) {
  showSlides(slideIndex = n);
}

function showSlides(n) {
  let i;
  let slides = document.getElementsByClassName("mySlides");
  let dots = document.getElementsByClassName("dot");
  if (n > slides.length) {slideIndex = 1}    
  if (n < 1) {slideIndex = slides.length}
  for (i = 0; i < slides.length; i++) {
    slides[i].style.display = "none";  
  }
  for (i = 0; i < dots.length; i++) {
    dots[i].className = dots[i].className.replace(" active", "");
  }
  slides[slideIndex-1].style.display = "block";  
  dots[slideIndex-1].className += " active";
}



























































// error testing 
//fetch("https://pokeapi.co/api/v2/pokemon/pikachu")

    //.then(response => console.log(response)) //is used to see if i get a responce from the api
    //.then(response => response.json())

    //.then(response => {

      //  if(!response.ok){
            //throw new Error("could not not fetch resource");// if the resource could not be found
                       
     //   }
     //   return response.json();


   // })



   // .then(data => console.log(data.species))
    //.catch(error => console.error(error));// to catch errors
