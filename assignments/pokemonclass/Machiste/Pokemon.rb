require 'pry'

class Pokemon
  def initialize(max_health, attack, defense, accuracy, cry = '...', name = 'Missingno')
    @name = name
    @attack = attack
    @max_health = max_health
    @current_health = @max_health
    @defense = defense
    @cry = cry
    @power_points = 40

    # Custom attributes example
    @accuracy = accuracy # accuracy must be between 0 and 100
  end

  # Getters and setters (the long way)
  # ------------------
  def name
    @name
  end

  def name=(name)
    @name = name
  end

  def attack
    @attack
  end

  def attack=
    @attack = attack
  end

  def max_health
    @max_health
  end

  def max_health=(max_health)
    @max_health = max_health
  end

  def current_health
    @current_health
  end

  def current_health=(health)
    @current_health = health
  end

  def defense
    @defense
  end

  def defense=(defense)
    @defense = defense
  end

  def accuracy
    @accuracy
  end

  def accuracy=(accuracy)
    @accuracy = accuracy
  end

  def power_points
    @power_points
  end

  def power_points=(pp)
    @power_points = pp
  end
  # ------------------

  def damage(opponent, amount) # The damage method - essential to attack moves
    if rand(accuracy..100) < 50
      puts "#{@name}'s attack missed!"
    else
      damage_amount = amount - opponent.defense
      damage_amount = 0 if damage_amount < 0
      opponent.current_health -= damage_amount
      puts "#{@name}: #{opponent.name} took #{damage_amount} damage!"
    end
  end

  def full_heal
    @current_health = @max_health
  end

  def cry
    puts @name + ': ' + "\"#{@cry}\""
  end

  def to_s
    puts "#{@name}: #{current_health} / #{max_health} HP | Attack: #{@attack} | Defense: #{@defense} | Accuracy: #{@accuracy} | Power Points (PP): #{@power_points}"
  end
end

# Individual Pokemon Classes
# -------

class Kakuna < Pokemon
  def harden
    @defense += 1
    puts "#{@name} used Harden! #{@name}'s defense increased by 1!\n"
  end
end

class Mewtwo < Pokemon
# Moves
  def psychic(opponent, attack)
    if power_points > 0
      damage(opponent, attack)
      opponent.accuracy -= 1
      puts "#{@name} used Psychic! #{opponent.name}'s accuracy fell by 1!\n"
      self.power_points -= 1
    else
      puts "#{@name}'s too tired to attack!\n"
    end
  end
end

class Magikarp < Pokemon
  def splash(opponent)
    puts "#{@name}: Well this is awkward..."
    amount = 1
    opponent.accuracy += amount
    puts "#{@name}: You've pissed off #{opponent.name}! Their accuracy has increased by #{amount}!\n\n"
  end
end

# BATTLE!
# =============

p1 = Magikarp.new(100, 1, 10, 50, 'Derp? Derp derp?', 'Magikarp')
p2 = Mewtwo.new(500, 40, 80, 85, 'NYAHHHHHHH!', 'Mewtwo')

def battle_status(p1, p2)
  puts "\nBATTLE STATUS:\n\n"
  p1.to_s
  p2.to_s
  puts "\n"
end

# Battle moves

puts "POKEMON BATTLE - BEGIN!\n===============\n\n"
sleep(1)
p1.cry
sleep(1) # For dramatic pauses
p2.cry
sleep(1)
battle_status(p1, p2)
sleep(2)
p1.splash(p2)
sleep(2)
p2.psychic(p1, 50)
sleep(2)
battle_status(p1, p2)
sleep(2)
p1.splash(p2)
sleep(2)
p2.psychic(p1, 30)
sleep(2)
battle_status(p1, p2)
sleep(2)
p1.splash(p2)
sleep(2)
p2.psychic(p1, 20)
sleep(2)
battle_status(p1, p2)
sleep(2)
p2.psychic(p1, 40)
sleep(2)
puts "\n#{p1.name} fainted! #{p2.name} wins!"
sleep(1)
p2.cry
