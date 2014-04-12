#adapted from http://rubylearning.com/satishtalim/ruby_inheritance.html

class Bird
  def preen
    puts "I am cleaning my feathers."
  end
  def fly
    puts "I am flying."
  end
end

class Penguin < Bird
  #Bird already gave us a fly method!
  #By writing it here, we're going to completely overwrite it. That's useful often!
  def fly
    puts "Sorry. I'd rather swim."
  end
end

p = Penguin.new
p.preen
p.fly
