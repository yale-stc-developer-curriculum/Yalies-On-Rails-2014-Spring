class Pokemon
	
	def initialize
		@name = "Missingno"
	end
	
	def name
		@name
	end
	def name= newname
		@name = newname
	end
	
	def current_health
		@current_health
	end
	def current_health= new_health
		@current_health = new_health
	end
	def max_health
		@max_health
	end
	def max_health= new_health
		@max_health = new_health
	end
	
	def damage n
		if invincible
			@current_health
		elsif @godmode
			@current_health = 9000
		else
			@current_health = @current_health - n
		end
	end
	def fullheal
		@current_health = @max_health
	end
	
	def attack
		@attack
	end
	def attack= n
		@attack = n
	end
	def defense
		@defense
	end
	def defense= n
		@defense = n
	end
	
	def cry
		puts @cry
		if weak
			print "..:'("
		end
	end
	def cry= string
		@cry = string
	end
	
	def invincible
		@invincible
	end
	def invincible= bool
		@invincible = bool
	end
	
	def weak
		@weak
	end
	def weak= bool
		@weak = bool
	end
	
	def godmode
		@godmode
	end
	def godmode= bool
		@godmode = bool
	end
	
end

p = Pokemon.new
p.name= "Arceus"
p.godmode= true
p.cry= "rawr"
p.max_health= 10
p.current_health= 10
p.damage 5
puts p.current_health
p.cry

class SuperSaiyan < Pokemon
	def initialize
		@name = "Goku"
		@cry = "IT'S OVER 9000!!!"
		@invincible = true
	end
	def rek enemy
		enemy.damage 9000
		puts "rekt!1"
	end
end

class Pirate < Pokemon
	def initialize
		@move2pp = 3
		@name = "Blackbeard"
		@cry = "AAAAAAAAARRRR!!"
	end
	def swashbuckle enemy
		enemy.damage 10
	end
	def boardShip enemy
		if (@move2pp != 0)
			enemy.damage 100
			@move2pp = @move2pp - 1
		end
	end
	def walkThePlank
		@current_health = 0
	end
end

class President < Pokemon
	def initialize
		@name = "Peter Salovey"
		@cry = "Hello there!"
	end
	def useMustache enemy
		enemy.current_health= 0
		puts "BWAHAHAHA"
	end
end



s = SuperSaiyan.new
s.cry
