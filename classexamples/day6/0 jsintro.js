//Javascript types of variables
//objects (sorta hashy but more powerful)
//strings (text)
//booleans (true/false)
//numbers
//undefined
//null

//
//Objects vs Hashes
//




////Javascript doesn't have "hashes", they only use "objects".
//Objects look and function the same but they are more flexible
//This creates a person object
var person = {
  firstName : 'Casey',
  lastName : 'Watts!'
};

console.log( 'First name: ' + person.firstName );     // dot notation is more common and easier to read. Ruby uses this too.
console.log( 'Last name: ' + person[ 'lastName' ] );  // bracket notation looks more like a "hash"

//Compare the javascript above to the Ruby hash version
//person = {
//  firstName: 'Casey',
//  lastName: 'Watts!'
//}
//
//this is equivalent to the rocket syntax
//person = {
//  :firstName => 'Casey',
//  :lastName => 'Watts!'
//}
//puts 'First name: ' + person.firstName //
//puts 'Last name: ' + person[:lastName] //ruby uses a symbol to access it (with the colon), the javascript above uses a string




//
//Functions
//

function myfun(arg1, arg2){
  console.log(arg1);
}

//compare the javascript above to Ruby
//def myfun arg1 arg2
//  puts arg1
//end
//How is the argument list delimited in each?
//How does the body of the function end and start in each?
//What marks the end of a statement in each?

if ( 1 ){
  console.log('1 is truthy');
}




//
//Storing Functions in Objects (~those hashy things)
//

var person = {
  firstName : 'Boaz',
  lastName : 'Sender',
  greet : function(name) {
    console.log( 'Hi, ' + name );
  }
};

person.greet( person.firstName );
// try to type person.greet without parentheses

var person = 
greet : function(name) {
    console.log( 'Hi, ' + name );
  }

//functions can be passed as if they were variables!
//functions require parenthesis to be called
//we haven't done objects and classes in Ruby yet, we'll return to that later




