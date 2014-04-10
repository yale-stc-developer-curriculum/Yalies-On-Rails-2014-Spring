class Pokemon

	def initialize
		@name = "Missingno"
		@current_health = @max_health
		@max_health = 50
		@defense = 10
	end

	def name
		@name
	end

	def max_heatlh
		@max_health
	end

	def current_health
		@current_health
	end

	def attack
		@attack
	end

	def defense
		@defense
	end

	def cry
		puts @cry
	end

	def color
		@color
	end

	def gender
		@gender
	end

	def height
		@height
	end

	def full_heal
		@current_health = @max_health
	end

	def damage amount
		if (amount-@defense > 0)
			@current_health = @current_health - amount + @defense
		end
		if (@current_health < 1)
			puts "#{name} has fainted!"
		end
	end
end

class Rhydon < Pokemon
	def initialize(attack = nil, defense = nil)
		@max_health = 50
		@current_health = @max_health
		if attack
			@attack = attack
		end
		if defense
			@defense = defense 
		end
		@cry = "I AM RHYDON SEE ME ROAR"
		@name = "Rhydon"
		@powerpoints = 2
	end

	def headbutt otherpokemon
		otherpokemon.damage 10
	end

	def horndrill otherpokemon
		if @powerpoints > 0
			otherpokemon.damage 30
			@powerpoints = @powerpoints - 1
		else
			puts "You cannot use this attack"
		end
	end

	def tackle otherpokemon 
		otherpokemon.damage 5
	end

	def sandattack otherpokemon
		otherpokemon.defense = otherpokemon.defense-2
	end

	def cry
		puts @cry
	end

end

class Blastoise < Pokemon

	def initialize
		@max_health = 50
		@current_health = @max_health
		@defense = 10
		@cry = "WATER WATER WATER"
		@name = "Blastoise"
	end

	def tackle otherpokemon
		otherpokemon.damage 5
	end

	def surf otherpokemon
		otherpokemon.damage 15
	end

	def waterblast otherpokemon
		otherpokemon.damage 25
	end

	def cry
		puts @cry
	end

end


class Magmar < Pokemon

	def initialize
		@max_health = 20
		@current_health = @max_health
		@defense = 10
		@cry = "YOU MIGHT NOT KNOW ME BUT I HURT"
		@name = "Magmar"
	end

	def firepunch otherpokemon
		otherpokemon.damage 50
	end


	def cry
		puts @cry
	end

end

Maggie = Magmar.new
Rhydie = Rhydon.new
Rhydie.horndrill Maggie
Rhydie.horndrill Maggie
Rhydie.horndrill Maggie
puts "YEAH"
