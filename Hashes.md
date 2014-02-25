## Review of Arrays
Arrays allow you to store an ordered list of objects:
```ruby
    friends = ["Allison", "Bob", "Charlie"]
```

We can retrieve items from an array using their index (starting at 0):
```ruby
    friends[0] # "Allison"
    friends[2] # "Charlie"
```

We can also iterate over an array using 'each', which lets us run code using each item in an array.
```ruby
friends.each do |current_friend|
  puts "Hello, #{current_friend}!"
end

# Hello Allison!
# Hello Bob!
# Hello Charlie!
```

## Hashes
Like arrays, hashes store a list of items, but instead of retrieving items by index (their order in the list), we do so by using the 'key', which is much like a label.
When we put things into a hash, we do so in pairs, which we call ***key-value pairs***.
The key is the label for the 'value', or item that we want to store. To put it another way, it's a structured or labeled list.

### Why Use Hashes?
Hashes are great for storing information where we care less about the **order** of things we put in, and more about what each item in the hash **represents**. 

For example, if we have an social network for cheese aficionados,  we may want to store profile information for each user. In a simple case, we may store their first and last names, and their favorite cheese.  If we used an array, we'd need to know and keep track of what order we store these three items:
```ruby
# Profile in array form, NOT ideal!
profile_array = ["Adam", "Bray", "Gouda"]
# To get the last name:
profile_array[1] # "Bray"
```

The fact that the last name is stored 2nd isn't really meaningful, but we have to know that to use our code, and it makes our code more prone to bugs.

Let's create a hash to accomplish the same thing (storing profile information), but that's easier to use.

### Creating a Hash
We use curly braces to denote a hash. Within the hash, each pair consists of a key, followed by '=>' (the so-called hash-rocket), followed by the value. Each pair is separated by commas.
```ruby
my_profile = {:first_name => "Adam", :last_name => "Bray", :favorite_cheese => "Gouda" }
```

###Retrieving Items from a Hash
To retrieve items, we use syntax similar to arrays, only we use the key instead of the index.
```ruby
# Array
profile_array[1] # "Bray
# Hash
my_profile[:first_name]       # "Adam"
my_profile[:favorite_cheese]  # "Gouda"
```

If we try to retrieve an item using a key that doesn't exist, we get ```nil```.
```ruby
my_profile[:middle_name] # returns nil
```

###Adding Items to a Hash
To add an key-value pair to a hash, we again use syntax similar to arrays, but specifying the key instead of the index:
```ruby
my_profile[:language] = "English"
puts my_profile
# {:first_name => "Adam", :last_name => "Bray", :favorite_cheese => "Gouda", :language => "English }
```

###Duplicates
Arrays can't have to pairs with the same key. If you try to add a new pair with a key that already exists, then it will overwrite the value of the original pair:
```ruby
animal_sounds = {:cat => "meow", :dog => "woof"}
animal_sounds[:cat] = "roar"
puts animal_sounds 
# {:cat => "roar", :dog => "woof"}
```

Duplicate values are allowed though
```ruby
animal_sounds[:lion] = "roar"
puts animal_sounds 
# {:cat => "roar", :dog => "woof", :lion => "roar"}
```

###Acceptible Keys
You can use any ruby object as a key or value, and you can mix and match within a hash:
```ruby
weird_hash = {"one" => 1, 2 => "two", "pi" => 3.14159, 1 => "the first number"}
weird_hash["one"]     # 1
weird_hash[1]         # "the first number"
```

What happens if you tried these?
```ruby
weird_hash[44]
weird_hash["two"]
```
In both cases, you'd get nil, as neither ```44``` or ```"two"``` are keys in this hash.

###Best Practices
In most cases, it is best to use symbols for the keys in your hashes, for three reasons:

1. **Performance** -  symbols use less memory and are faster.
2. **Consistency** - Using string or other objects often makes it easier to make mistakes (i.e. with capitalization of strings).
3. **Improved Syntax** (See below).

#### Modern Hash Syntax
When the keys are symbols, you can use a newer, cleaner syntax where you omit the hash-rockets, and move the colon to the end of the symbol:

```ruby
my_profile = {first_name: "Adam", last_name: "Bray", favorite_cheese: "Gouda"}
animal_sounds = {dog: "woof", cat: "meow", fox: "?"}
```

This syntax is valid in Ruby 1.9 or later.
