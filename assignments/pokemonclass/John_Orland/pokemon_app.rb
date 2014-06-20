require 'sqlite3'
require 'active_record'
require 'pry'
require 'csv'

require_relative 'poke_database_connection'
require_relative 'pokemon'
#run `ruby poke_database_creation.rb` once to create the database you start with

  #attr_accessor :name, :current_health, :max_health
#		:defense, :attack, :cry,
   #             :strength, :speed, :focus

class Magmar < Pokemon
  def initialize
    @name = "Magmar"
    @max_health = 300
    @current_health = 300
    @defense = 10
    @attack = 10
    @strength = 5
    @speed = 5
    @focus = 6
    @pp = 10
  end

    def move1 opponent
      puts "Magmar uses Lava Blast!"
      opponent.damage(5*@attack.to_i + @focus.to_i/10)
      return nil
    end

    def move2
      puts "Magmar uses meditate...focusing."
      @focus = @focus + 1
      @pp - 1
    end

    def move3 opponent
      puts "Magmar uses Mud Fling!"
      opponent.speed = opponent.speed - 1
      opponent.defense = opponent.defense - 1
      return nil 
    end
   
    def cry
      puts "Magmar: " + ["Mraghhhhhhhhhh...", "Aghhhhhhhhhh...", "Uhhhhhhhggggg..."].sample 
    end 
  end 

class Geodude < Pokemon
  def initialize
    @name = "Geodude"
    @max_health = 250
    @current_health = 250
    @defense = 15
    @attack = 10   
    @strength = 10
    @speed = 3
    @focus = 4
    @pp = 10
  end

    def move1 opponent
      puts "Geodude uses Rock Throw!"
      opponent.damage(5*@attack.to_i + @strength.to_i/10)
      return nil
    end

    def move2
      puts "Geodude uses harden...strengthening."
      @strength = @strength + 1
      @pp - 1
    end

    def move3 opponent
      puts "Geodude uses flex! " + opponent.name + " is distracted!"
      opponent.speed = opponent.focus - 1
      opponent.defense = opponent.defense - 1
      return nil 
  end
    
    def cry
      puts "Geodude: " + ["Grrr...", "Rarrrrrr...", "Hnngggg..."].sample
    end
   
end 

class Machop < Pokemon
  def initialize
    @name = "Machop"
    @max_health = 250
    @current_health = 250
    @defense = 9
    @attack = 12
    @strength = 20
    @speed = 5
    @focus = 5
    @pp = 6
  end

    def move1 opponent
      puts "Machop uses Uppercut!"
      opponent.damage(5*@attack.to_i + @strength.to_i/10)
      return nil
    end

    def move2
      puts "Machop uses Zen...gaining speed."
      @strength = @speed + 1
      @pp - 1
    end

    def move3 opponent
      puts "Machop uses maim. " + opponent.name + " is injured!"
      opponent.speed = opponent.focus - 1
      opponent.defense = opponent.defense - 1
      return nil 
  end
   
    def cry
       puts "Machop: "["HRGHH...", "ARGH....", "RAHHH!!!..."].sample
    end
end 

def status a, b
  if a.current_health <= 0
    puts a.name + " has fainted!"
    return 1
  elsif b.current_health <= 0
    puts b.name + " has fainted!"
    return 1
  else
    puts "the battle continues.."
    return 0
  end
end
  puts "POKEMON BATTLE IS BEGINNING!"
  sleep(2)

  a = Magmar.new
  b = Geodude.new

  sleep(1)

  a.move1 b
  a.cry
  sleep(1)
  b.move1 a
  b.cry
  sleep(1)
  status(a, b)
  a.cry
  sleep(1)
  a.move2
  sleep(1)
  b.move2
  sleep(1)
  a.move3 b
  sleep(1)
  b.move3 a
  b.cry
  sleep(1)
  a.move1 b
  sleep(1)
  b.move1 a
  a.cry
  sleep(1)
  status(a, b)
  sleep(1)
  a.move1 b
  sleep(1)
  b.move1 a
  sleep(1)
  status(a, b)
  sleep(1)
  a.move1 b
  sleep(1)
  b.cry
  b.move1 a
  sleep(1)
  status(a, b)
  sleep(1)
  a.move1 b
  b.cry
  sleep(1)
  status(a, b)


  puts "Magmar is victorious!"


