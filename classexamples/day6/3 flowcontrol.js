//javascript doesn't have an iterator "each"
//jQuery has something similar
//We can use a for loop though! (Ruby does have these too we just don't have to use them as often)

//
//Our Pierson Cheer example from Ruby
//
//#Pierson Cheer
//letters = ['P', 'I', 'E', 'R', 'S', 'O', 'N', 'C', 'O', 'L', 'L', 'E', 'G', 'E']
//
//i = 0
//while (i < letters.length)
  //puts letters[i]
  //i = i + 1
//end
//
//lett = 'P'
//letters.each do |lett|
  //binding.pry if lett == "P"
  //puts "The " + lett + " is for the " + lett + " in Pierson College!"
//end

//
//Pierson Cheer in Javascript
//

var letters = ['P', 'I', 'E', 'R', 'S', 'O', 'N', 'C', 'O', 'L', 'L', 'E', 'G', 'E'];
var i = 0;
while (i < letters.length){
  alert("The " + letters[i] + " is for the " + letters[i] + " in Pierson College!");
  i = i + 1;
}

