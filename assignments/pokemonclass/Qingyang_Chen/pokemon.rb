class Pokemon
	def initialize(name, max_health, defense, attack, cry, gender, type, pp)
		# Required attrs
		@name = name
		@max_health = max_health
		@current_health = max_health
		@defense = defense
		@attack = attack
		@cry = cry
		# Custom attrs
		@gender = gender
		@type = type
		@pp = pp
	end
	def damage(amount)
		amount = [0, amount - @defense].max
		damage = [@current_health, amount].min
		@current_health -= damage
		puts @name + " suffered " + damage.to_s + " damage and is at " + @current_health.to_s + " health."
		if @current_health == 0
			puts @name + " died."
			exit
		end
	end
	def heal(amount)
		heal = [@max_health - @current_health, amount].min
		@current_health += heal
		puts @name + " healed " + heal.to_s + " hp and is at " + @current_health.to_s + " health."
	end
	def full_heal
		@current_health = @max_health
		puts @name + " fully healed!"
	end
	def cry
		puts @cry
	end
	def current_health
		@current_health
	end
end

class Randomouse < Pokemon
	def initialize(name = "Randomouse")
		cry = "IM SO RANDOM"
		max_health = 100
		defense = 5
		attack = 2
		gender = "Male"
		type = "Glass"
		pp = 0
		super(name, max_health, defense, attack, cry, gender, type, pp)
	end
	def randomize
		puts @name + " used randomize."
		@current_health = 1 + rand(@max_health)
		puts @name + " randomized to " + @current_health.to_s + " health."
	end
	def cry
		puts @cry
	end
end
class Eekwolizer < Pokemon
	def initialize(name = "Eekwolizer")
		cry = "Eeeeeekkkkwwwwooooo"
		max_health = 50
		defense = 2
		attack = 5
		gender = "Female"
		type = "Psychic"
		pp = 8
		super(name, max_health, defense, attack, cry, gender, type, pp)
	end
	def equalhit(otherpokemon)
		puts @name + " used equalhit."
		if @pp > 0
			otherpokemon.damage(@current_health)
			@pp -= 1
		else
			puts "Out of pp"
		end
	end
	def equalheal(otherpokemon)
		puts @name + " used equalheal."
		if @pp > 0
			heal(otherpokemon.current_health)
			@pp -= 1
		else
			puts "Out of pp"
		end
	end
	def equalcry(otherpokemon)
		puts @name + " used equalcry."
		otherpokemon.cry
	end
	def cry
		puts @cry
	end
end
class Defender < Pokemon
	def initialize(name = "Defender")
		cry = "Standing ground..."
		max_health = 200
		defense = 10
		attack = 0
		gender = "Male"
		type = "Rock"
		pp = 0
		super(name, max_health, defense, attack, cry, gender, type, pp)
	end
	def wall
		puts @name + " used wall."
		@defense *= 2
	end
	def cry
		puts @cry
	end
end

p1 = Eekwolizer.new
p2 = Randomouse.new

p1.equalhit(p2)
p2.randomize
p1.equalheal(p2)
p2.randomize
p1.equalhit(p2)
p2.randomize
p1.equalcry(p2)
p2.randomize
p1.equalhit(p2)
p2.randomize
p1.equalhit(p2)
p2.randomize
p1.equalhit(p2)
p2.randomize
p1.equalhit(p2)
p2.randomize
p1.equalhit(p2)
p2.randomize