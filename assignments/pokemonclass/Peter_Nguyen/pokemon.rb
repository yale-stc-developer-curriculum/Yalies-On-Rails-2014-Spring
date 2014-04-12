def hp_bound hp
    if hp > 999 || hp < 10
        raise RangeError, "#{hp} is out of range!"
    else
        return hp
    end
end

class Pokemon
    attr_accessor :name, :max_hp, :curr_hp, :defense, :attack, :cry, :critical, :max_pp, :curr_pp
    
    def initialize(name = "missingno", cry = "...", max_hp, defense, attack)
        @name = name
        @max_hp = hp_bound max_hp
        @curr_hp = max_hp
        @defense = defense
        @attack = attack
        @cry = cry
        @critical = 1
        @max_pp = 5
        @curr_pp = 5
    end

    def damage amount
        @curr_hp = [0, @curr_hp - [0, (amount - @defense)].max].max
    end

    def full_heal
        @curr_hp = @max_hp
    end

    def cry
        puts @cry
    end

end

class Beedrill < Pokemon
    def initialize(name = "Beedrill", cry = "...", max_hp, defense, attack)
        super(name, cry, max_hp, defense, attack)
    end

    def sting_atk enemy
        enemy.damage @attack * @critical * 5
    end

    def swords_dance
        @attack *= 3
        @critical += 1
    end

    def horn_drill enemy
        if @curr_pp > 0
            enemy.curr_hp = 0
            @curr_pp -= 1
        else
            puts "No pp left :)"
        end
    end
end

class Mewtwo < Pokemon
    def initialize(name = "Mewtwo", cry = "...", max_hp, defense, attack)
        super(name, cry, max_hp, defense, attack)
    end

    def psychic enemy
        enemy.damage 80
    end
end

class Metapod < Pokemon
    def initialize(name = "Metapod", cry = "...", max_hp, defense, attack)
        super(name, cry, max_hp, defense, attack)
    end

    def harden
        puts "HARDEN!!!"
        @defense *= 10
    end
end

def isDead pokemon
    if pokemon.curr_hp == 0
        puts "#{pokemon.name} has fainted!"
    end
end

metapod = Metapod.new(100, 10, 0)

beedrill = Beedrill.new("Beedrill", "buzzzz", 80, 2, 7)

metapod.harden
beedrill.sting_atk metapod

metapod.harden
beedrill.swords_dance
puts metapod.curr_hp

beedrill.sting_atk metapod
metapod.harden

puts metapod.curr_hp

beedrill.horn_drill metapod
isDead metapod

beedrill.cry
metapod.cry