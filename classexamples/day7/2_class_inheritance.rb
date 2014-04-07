#adapted from http://rubylearning.com/satishtalim/ruby_inheritance.html

class Mammal
  def breathe 
    puts "inhale and exhale"
  end
end

class Cat < Mammal
  def speak
    puts "Meow"
  end
end

whiskers = Cat.new
whiskers.breathe
whiskers.speak


#you can sorta pretend that the Cat class looks like this
class Cat
  #inherited this one
  def breathe 
    puts "inhale and exhale"
  end

  #didn't inherit this one
  def speak
    puts "Meow"
  end
end

