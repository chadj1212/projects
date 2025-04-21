# poke api



## Getting started

this will briefly explain on how to manage this code



## Name
POKE api

## Description
This website will be used to summon Pokémon, learn about them and view their stats. there will also be a mini game included.





## Roadmap
Right now you can search Pokémon and view some info about them and their stats. i want to also include the possibility to see their egg groups. view different Pokémon forms, have the background colour change on the basis of what type they are, mini games, improve how the stats are displayed.



## Authors and acknowledgment
https://pokeapi.co/

https://www.youtube.com/watch?v=37vxWr0WgQk&t=764s

https://www.youtube.com/watch?v=xMHZl5FlwXQ&t=964s

https://www.youtube.com/watch?v=T-VQUKeSU1w&t=2158s

## brief explination of how to make use of the code. and the api

This explanation will split in to two parts. How the API is used on this website and how to add more things and what all is possible with the API.

Part one: 
so if there are any cosmetic changes that needs to be made that can be done by accessing the index html file, CSS folder and the JS folder.
CSS/pokestyle.css
JS/slide-show.js
JS/slide-show.js

Here you can make changes regarding the view of the site and add changes.

Now the API being used is from the https://pokeapi.co/ website.

The ones this website specifically using on this site is the API that fetches overall Pokémon data  such as type, weight, stats, sprites etc
https://pokeapi.co/api/v2/pokemon/ditto
and also the https://pokeapi.co/api/v2/pokemon-species/ditto which is used to fetch Pokémon description.
This website makes use of input method where the user can manually input names for the Pokémon the show up with their respective information.


To display each info you need to make sure that you make a const and make sure its invokes with the right information you need and use the .innerHTML= ; to display it on the html site


Now part 2:
If you would like to add more Api’s its possible but I do recommend that each individual api added has its own respective file to make management easier.
For more information regarding to each API I recommend visiting the https://pokeapi.co/docs/v2 website and give a read.






## License
For open source projects, say how it is licensed.

## Project status
Right now you can search most Pokémon with no issues. doesn’t give any error messages completely.
