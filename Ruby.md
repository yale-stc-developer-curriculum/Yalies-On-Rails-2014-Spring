Check out the [demo code](https://gist.github.com/adambray/5646135) from Friday, May 24th's lesson.

#Runing ruby programs
When writing your programs, make sure to save it as a file ending in .rb (i.e. lolcat.rb), and in a convenient directory. It's best not to use spaces in your folder or file names, as these spaces are difficult to deal with in the command line.

To run the program, *cd* to the apporpriate directory and use the *ruby* command on your file:
    cd path/to/code
    ruby lolcat.rb

If you want to play with Ruby without saving and running files, you can use *irb* (interactive ruby) which lets you type ruby commands and see the results instantly.

If you start irb, you have to exit before you can run any 'standard' terminal commands such as 'ls', 'cd', or 'ruby filename.rb'. To exit irb, type 'exit'.

#Ruby Basics

Much like the command line, programs in Ruby are made of **statements**, which are (usually) one line long. Statements are like sentences, in that they are composed of nouns, which represent things, and verbs, which perform actions. 

In ruby, we call nouns **objects**, and we call verbs **methods** (sometimes called **functions**).

#Objects

The term *objects* carries quite a bit of meaning in programming (which we'll cover later). But for now, it's enough to know that objects represent *things* or *information* in our programs. Examples of objects are **numbers** and **strings** of text.

##Numbers

In Ruby, like in other programming languages, we have two common types of numbers, integers and decimals.

Here are some integers

    1
    9129312312
    -2
    0
    87
    
And here are some decimals:

	1.1
	2.000
	9999.9999
	15874.8493

Numbers work pretty much like we'd expect. For example, create a file called `numbers.rb` and make it something like this:

	puts 1+1
	puts 100 - 10
	puts 8 * 8
	puts 40 / 5
	puts 2.2 + 3.2

Save the file and run it using `ruby numbers.rb`, and you should get output like this:

	2
	90
	64
	8
	5.4

###The `puts` command
You may be wondering what that `puts` part of each statment means. We'll talk about methods more later, but puts is a method that outputs information to the screen when you run the program. Without the `puts`, ruby would run all the calculations in the program, but we wouldn't see the results.

##Strings

Strings are bits of text. To make a string, we put the text in quotes: **"This is a string of text."**

**Strings** can be joined together with the '+' method (also called **concatenate**). For example:
    
    "Elihu " + "Yale"
    => "Elihu Yale"

(The `=>` indicates the result returned by the statement previous statment.)

Ruby gives us lots of built-in methods to work with strings. Here are just a few:

	"How now, brown cow?".reverse
	=> "?woc nworb ,won woH"
	
	"How now, brown cow?".upcase
	=> "HOW NOW, BROWN COW?"
	
	"How now, brown cow?".downcase
	=> "how now, brown cow?"
	
	"How now".length
	=> 7
	
##Mixing Numbers and Strings

When we're working with text, it's common to mix letters and numbers, so it's important to understand how Ruby treats them in combinaton.

Here are a few examples, which work as we'd expect:

	puts 10 + 10
	=> 20

	puts "10" + "10"
	=> "1010"

	puts "10 + 10"
	=> "10 + 10"
	
But what if we try to mix them?

	puts "10" + 10
	#=> TypeError: can't convert Fixnum into String

In this first case, Ruby sees `"10" + ___` and expects the second object to be a string as well. When it sees a number instead, it complains. 

What about the opposite order?

	puts 10 + "10"
	#=> TypeError: String can't be coerced into Fixnum

Similarly, in the second case, Ruby sees `10 + ___` and exects the second object to be a number as well. When it sees a string instead, again, it complains.

Note the errors are similar, but not exactly the same.

But you may be thinking, 'Aren't computers pretty smart? Shouldn't Ruby be able to see `"10" + 10` and know I want `20`? Well, Ruby can convert strings to numbers and vice versa, but the trick is the ambiguity. In this case, we might just have well expected `"10" + 10` to equal `1010`.

To fix this, we have to tell Ruby exactly what we want, but converting the numbers to strings, or the strings to numbers.

To do this, we use the methods `to_i` or `to_s` to convert objects to **integers** or **strings**, respectively.

	puts "10" + 10.to_s
	=> "1010"

or

	puts 10 + "10".to_i
	=> 20
	
#Methods

We've already encountered a few methods, including `puts`, `reverse`, `length`, `to_i`, `to_s`, but also `+`, `-`, and the other math methods.

All methods are ways of taking action. In the above examples, Ruby came with those methods built-in, but as we'll see, we can also create our own custom methods.

##Calling Methods

Just like it doesn't make sense to have a verb without a noun, all methods have to be *called* (or take action) on a specific object.

Most commonly, a method is explicitly called on an object, using the following syntax: 
	
	some_object.some_method

In this case, we can think about the method as being a part of the object. It's written specifically for that type of object. For example, the `reverse` method was designed for strings, so we can call `.reverse` on any string. But we can't call `5.reverse` because numbers don't have this method.

But what about `puts`? We don't seem to call `puts` on anything?

The truth is, if we don't specify what to call a method on, Ruby assumes we're calling it on whatever object we're *inside*. That concept is a bit advanced, so we'll have to get to it later. But for now, know that methods like `puts` are called on something, we just don't see it.

##Arguments

Methods can take *arguments*, which let us pass additional information to the method, which, for example, might to tell it how to do its work.

For example, consider the the `+` method for numbers. While we often write something like`7 + 5`,that's just a special form Ruby gives us for convenience.

In reality, we're calling the `+` method on the first number, or in other words `7.+`. But what about the second number? That's actually an *argument* to the addition method that tells it what exactly to add to its object.

So, another way to write this would be:

	7 + 5
	# is the same as
	7.+ 5

Ruby gives us flexibility in how we indicate the arguments we're passing to a method. We can also put the arguments in `()` when we need to be more explicit:

	7.+(5)

Methods can take more than one argument, such as the `insert` method for strings:

	"abcd".insert(0, 'X')    
	=> "Xabcd"

As we can see, we need to tell this method where to insert the letter, and what letter to insert. (Ruby, like almost every other programming language, starts counting at 0, not 1).

#Variables

In programming, we often want to store objects so we can use them again later. We can do just that with *variables*. When we want to store something in a variable for use later, we *assign* that object to the variable, using the `=` operator.

To keep track of things, we have to give each variable a name. Names have to start with a lowercase letter, but after that, we can include any letter, number, or '_'.

Here are some examples of storing things in variables:

	my_favorite_dog = "Lassie"
	the_7th_guest = "Alice"
	number_of_hot_dogs_in_a_costco_sized_pack = 57

Variables can store any object, but they can't point to other variable. If we assign one variable to another, we are actually assigning the *value* of the second variable to the first.
	

	a = 100
	b = 200
	a = b

At this point, both a and b are storing the number 200. 
But what happens if we store something else in `b`?
	
	b = 999

	puts a
	=> 200
	puts b
	=> 999

Once we store an object in a variable, we can use that variable anywhere we might use the object it represents.

	my_name = "Adam"
	greeting = "Hello, " + my_name
	puts greeting
	=> "Hello, Adam"

	one_hundred = 100
	puts 50 + one_hundred
	=> 150

#Comparisons and Control

In programming, we often need to compare things, and make decision in our program based on the result of the comparison.

##Comparisons

Ruby gives us a number of methods to compare objects. We have the common greater-than or lesser-than comparison:

	puts 1 < 2
	=> true
	puts 1 > 2
	=> false
	
`==` tests if two objects are equal, `!=` tests whether they are unequal:

	puts 1 == 2
	=> false
	puts 1 == 1
	=> true

	puts 1 != 1
	=> false
	puts 1 != 2
	=> true

These also work on strings:

	puts "xbox" == "xbox"
	=> true
	puts "xbox" == "PS3"

The `<` and `>` compare strings alphabetically, as in a dictionary:

	puts "apple" < "pear"
	=> true
	puts "Xena" > "Buffy"
	=> true

## Branching

The `if` statement allows us to run different code, depending on whether an expression is `true` or `false`. Here's a simple example:

	puts "What is your name?"
	name = gets.chomp
	if name == "Adam"
		puts "Hello, my friend!"
	else
		puts "Hello, stranger!"
	end

	puts "This line is run after everything above, no matter what."

The part immediately after the `if` is the expression that is evaluated. If it is true, then the code in the first section is run. If it's not true, then the code in the second section is run instead.

The `end` tells Ruby when we're done running code depending on the results of the comparison.

Ruby doesn't care about the indentations, but they make our code much easier to read, so you should use them.

## true and false

`true` and `false` are special in Ruby, they are actually each their own objects.In other words, they are not the same thing as the *strings* "true" and "false".

In Ruby, we don't have to make an explicit comparison (such as `1 < 2`) to get a true/false value. 

If we put an object (string, number, etc) in a place where ruby expects a true/false value, it will convert it to true/false using a simple rule:

the `false` and `nil` objects are both false, everything else is true

Here is a (very) incomplete list of objects that evaluate to true in Ruby:

	true
	"true"
	1
	99
	0
	"dog"
	"false"

That last one may be confusing, but remember that the string "false" is not the same as the `false` object.

#Looping

We often want to repeat the same task over and over again. Loops make this possible (and dare I say fun!)

Of course, computers are really dumb (shhh don't tell them), so we have to tell them when to stop repeating, or they'll just keep going like the Energizer Bunny.

We start a loop with the `while` command, followed by an expression. As long as the expression is `true` the loop will run another time.

Here's an example:

	number_of_doughnuts = gets.chomp
	while number_of_doughnuts < 5
		puts "Keep eating!"
		number_of_doughnuts = gets.chomp
	end

However, we can use the `break` command to make this even simpler. `break` will exit out of the loop we're in, to the line right after the `end`.

	while true
		number_of_doughnuts = gets.chomp
		if number_of_doughnuts < 5
			puts "Keep eating!"
		else
			break
		end
	end

#Arrays

If you're anything like me, you loooove making lists. Shopping lists, lists of ideas for the next great startup, lists of my favorite pokeman... just kidding, I don't really know what pokeman are. :)

**Arrays** are just that, ordered lists of things (or as we call 'things' in Ruby, *objects*). To tell Ruby that we're making a list, we use the `[` and `]` characters for the beginning and end, and commas to separate items.

##Creating Arrays

Here, I've made a few arrays, and stored them in some variables (I'll be using these variables later to refer back to these lists:)

    shopping_list = ["Milk", "Eggs", "Bacon", "More Bacon"]

    startup_ideas = ["Twitter for Geese", "Ca$h4Gold for Pets", "LinkedIn for Toddlers"]

    favorite_pokemon = ["Seriously, I don't really know pokemon."]

Now you may have noticed that all these lists stored **strings** of text, but arrays can store any type of object. Here's an array of numbers:

    lucky_numbers = [4, 8, 15, 16, 23, 42]

In fact, we can put any object(s) in an array, and we can even mix-n-match types of objects in the *same* array:

    random_stuff = [12, "carrots", 199, "a caribou on the back of a salmon"]

See? We can put whatever we want in arrays. Awesome!

##Stuffing Ourselves (Adding more items to an array)

I just took a look at my shopping list, and I realize there's not much variety. My cardiologist would probably have a heart attack himself if he saw it. Let's fix that by adding another item to the list.

    #First, verify the contents of the array (we don't have to; this is just a reminder for you).
    puts shopping_list
    # ["Milk", "Eggs", "Bacon", "More Bacon"]

    #OK now let's add another item:
    shopping_list << "Canadian Bacon"

    #That should make him happy. Let's check the result:
    puts shopping_list
    # ["Milk", "Eggs", "Bacon", "More Bacon", "Canadian Bacon"]

The `<<` is really just a method, but just like `+` and `-`, Ruby lets us use this method in a way that is easier for us to read and write. Adding an item to the end of an array like this is sometimes called *pushing* an item onto the array.


##Fetch Lassie! (Retrieving from Arrays)
I don't know much about dogs, but if the TV commercials for *Beggin' Strips* brand dog snacks are true, they loooove bacon. I want to make sure I have bacon as the 3rd item in my shopping_list, so that I don't forget it.

There are a couple of ways to get items out of an array, but I'll only show you one right now. (We'll see another in the later section on **Iterators**).

Arrays are ordered lists, so we can get items out by using their order in the list, or **index**. In programming, we always start counting with **0**, not **1**. So the 'first' item in the list is at index **0**. The second item is at index **1**, and so on.

To get an item using its index, we use the method `[]`, passing the index as an argument.That may sound really confusing, but an example should make it clear:

    #First item
    puts shopping_list[0]
    # "Milk"

    #Now, let's get to the bacon
    puts shopping_list[2]
    # "Bacon"

Note that retrieving an item from an array *doesn't remove it from the array*, it's still there.

    bacon_from_up_north = shopping_list[4]
    
    puts bacon_from_up_north
    # "Canadian Bacon"

    puts shopping_list
    # ["Milk", "Eggs", "Bacon", "More Bacon", "Canadian Bacon"]

##Continuing Education

There are a lot more built-in methods to work with arrays. But instead of going over them here (really there are at least 50), I want you to get comfortable looking up documentation. So check out the [documentation for array](http://www.ruby-doc.org/core-1.9.3/Array.html). I'd read over the following at least:

* + and - (add )
* -
* compact
* delete_at
* first (and last)
* join
* length
* reverse

Arrays are great for lists where the items are ordered numerically, or where the order doesn't matter (it's not uncommon to ignore the indices of an array and work with the objects in other ways). But sometimes, you just want a little structure. That's where **hashes** come in.
 

#Hashes

Hashes are like arrays in that they store collections of things. But while an array stores a list of ordered objects, hashes store objects in pairs. In each pair, we have a key and a value. I like to think of these pairs like entries in the dictionary. The key would be the word we're looking up, and the value is the block of text that defines the meaning of the word.

We usually create a hash using curly brackets `{` and `}`. Here's an example:

    my_pets = { "Teeka" => "Cat", "Spaetzle" => "Cat", "Nigel" => "Hamster"}

The `=>` is used to indicate the relationship between the keys and values. This hash has three keys: "Teeka", "Spaetzle", and "Nigel". Each key is associated with one value, which in this case are "Cat", "Cat", and "Hamster".

##Adding and Retrieving Pairs

To retrieve a value from a hash, we use a similar syntax as we do for arrays, replacing the index with the key:

    puts my_pets["Teeka"]
    # "Cat"

    puts my_pets["Nigel"]
    # "Hamster"

To add items to a hash, we also use a similar syntax as we did for arrays:

    my_pets["Bob"] = "Turtle"

    puts my_pets["Bob"]
    # "Turtle"

##If it fits, it sits (aka what can we put in these?)

The great thing about hashs (and arrays) is that we can store any object in them (including more arrays and hashes). With hashes, this is true for both the key and the value. 

So far, the only objects we've shown you are strings, numbers, arrays, and hashes, but there are many others, and once you start creating your own objects, you'll probably want to store them in an array or hash as well, so keep that in mind!

##Continuing Education

Again, there's lots more to the hash class than I've shown you. I suggest you check out the [documentation for the Ruby Hash class] (http://www.ruby-doc.org/core-1.9.3/Hash.html).

Some useful methods are:

* keys
* values
* include?
* to_a

#Iterators

Hashes and arrays are united by the fact that they are both collections of objects. While programming, we often have a collection of objects, which we'd like to work with one-by-one. 

##Iterating Over Arrays
For example, let's consider my shopping list. What if I wanted to print out a copy of my shopping list, but with each item in UPPERCASE so I can read it easier.  I could do this with standard while loops, but it would be very messy:

    #NOT IDEAL!
    current_item_number = 0 #to keep track of what index we're on
    shopping_list_size = shopping_list.size #In this case, 5
    while item_number < shopping_list_size
        #Print the current item
        puts shopping_list[current_item_number].upcase
        #Increase our index, so
        current_item_number = current_item_number + 1 
    end

This produces the following output:

    MILK
    EGGS
    BACON
    MORE BACON
    CANADIAN BACON

Thankfully, with Ruby, there's a better way, the `each` method. Here's that same program, rewritten with `each`:

    shopping_list.each do |item|
        puts item.upcase
    end

Much better, right? You may be wondering what the `do`, `end`, and `|` all mean. When we use the `each` method, Ruby expects a chunk of code to repeat each time it gives us a new item in the array/hash. The `do` and `end` tell Ruby where that chunk (we call it a **block** of code) starts and ends.

The `|item|` is a way to reference the current item (out of all the items) in our block of code. The `item` part is just a variable we're creating on-the-fly, it could be called anything we want; we just have to make sure we refer to it using the same name in our block of code.

For example, this does exactly the same thing, even though it's a bit silly:

    shopping_list.each do |chicken_nugget_sauce|
        puts chicken_nugget_sauce.upcase
    end

Run it for yourself if you don't believe me. To Ruby, it doesn't matter that our variable is called `chicken_nugget_sauce`, it happily lets us use that variable name to refer to each item in the list.

##Iterating Over Hashes
The concept is exactly the same for hashes, only we get two variables each time we iterate, one for the key, and one for the corresponding value.

Here's an example using `my_pets`:

    my_pets.each do |name, species|
        puts "My pet " + name + " is a " + species
    end 

Gives us:

    My pet Spaetzle is a Cat
    My pet Nigel is a Hamster
    My pet Teeka is a Cat
    My pet Bob is a Turtle