class Pokemon
  def initialize
	@defense = 0
  end
  def name
    @name
  end

  def name= newname
    @name = newname
  end

  #health getters and setters
  def current_health
    @current_health
  end

  def current_health= newhealth
    @current_health = newhealth
  end

  def max_health
    @max_health
  end

  def max_health= newhealth
    @max_health = newhealth
  end

  def damage amount
    netdamage = amount - @defense
	if netdamage < 0
	  netdamage = 0
	end
    @current_health = @current_health - netdamage
  end

  def attack
	@attack
  end
  
  def defense
	@defense
  end

  def defense= value
	@defense = value
  end
  
  def full_heal
    @current_health = @max_health
  end
  
  def cry
	puts @cry
  end
  
  def defense value
	@defense = value
  end

end

class Pikachu < Pokemon
  def initialize 
	@name = "Pikachu"
	@max_health = 300
	@cry = "kya"
	@defense = 100
	full_heal
  end
  def neutrize opponent
	opponent.defense = 0
  end
  def recover
     @current_health += 200
  end
  
end

class Godzilla < Pokemon
  def initialize
	@name = "Godzilla"
	@max_health = 999
	@cry = "Gyao"
	@defense = 100
	full_heal
  end
  def fire opponent
	opponent.current_health -= 200
  end
  def self_destruction
    @current_health = 0
  end
  
end

class Angel < Pokemon
  def initialize 
	@name = "Angel"
	@max_health = 500
	@cry = "Hya"
	@defense = 500
	full_heal
  end
  def healing_love opponent
	opponent.current_health = opponent.full_heal
  end
  def death_sentence opponent
	opponent.current_health = 1
  end
  def self_recovery
	full_heal
  end
end

#fighting between Godzilla and Angel
g = Godzilla.new
a = Angel.new

puts g.current_health
puts a.current_health

a.death_sentence(g)
g.cry
puts g.current_health

g.fire(a)
a.cry
puts a.current_health

a.healing_love(g)
g.cry
puts g.current_health

g.self_destruction
g.cry
puts g.current_health



