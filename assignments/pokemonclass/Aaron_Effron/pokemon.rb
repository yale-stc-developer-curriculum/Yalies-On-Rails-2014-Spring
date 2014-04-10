class Pokemon

	def initialize
		@name = "Missingno"
		@current_health = @max_health
		@max_health = 999
		@defense = 10
	end

	def name
		@name
	end

	def max_heatlh
		@max_health

	def current_health
		@current_health
	end

	def attack
		@attack
	end

	def cry
		@cry
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

end

class Rhydon < Pokemon
	def initalize
		@cry = "I AM RHYDON SEE ME ROAR"
		@name = "Rhydon"
	end

	def headbutt otherpokemon
		otherpokemon.damage 10
	end

	def horndrill otherpokemon
		otherpokemon.damage 30
	end

	def tackle otherpokemon 
		otherpokemon.damage 5
	end

end

class Blastoise < Pokemon

	def initialize
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
	
end


class Magmar < Pokemon

	def initialize
		@cry = "YOU MIGHT NOT KNOW ME BUT I HURT"
		@name = "Magmar"
	end
end




