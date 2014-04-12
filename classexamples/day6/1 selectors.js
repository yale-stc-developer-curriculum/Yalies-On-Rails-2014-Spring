//
// Pure Javascript Selectors
//

<input type="text" id="playlistinputfieldid" class="beautifultextbox" name="playlistname">

// TagName
document.getElementsByTagName("input")

// ID
document.getElementById("myidlol")
// notice this is the only singular one! do you know why? :)

// Class Name
document.getElementsByClassName("beautifultextbox")

// Name attribute
document.getElementsByName("playlistname")




//
//jQuery Selectors
//

// All browsers have javascript, no problem.
// jQuery is a library you have to import.
// One way to import the jQuery library is to use the file Google hosts.
// More often, your application's server holds and distributes this file for you.
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>


//psst - "$()" is an alias for the supercharged function "jQuery()" that comes from the jQuery library
//Nobody uses "jQuery()" everyone uses "$()"


// jQuery Selectors are even easier!
// TagName
$("p")

// ID
$("#myidlol")

// Class Name
#(".beautifultextbox")

// Name attribute
// generically, #("[attribute='value']")
#("[name='playlistname']")



//
//Modifying CSS
//

bluebar = document.getElementById('blueBar');
bluebar.style.background = 'pink';

