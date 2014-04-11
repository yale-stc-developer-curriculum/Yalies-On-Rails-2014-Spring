class Pokemon

  def initialize
    @name = "Missingno"
    @max_health = 50
    @current_health = max_health
    @attack = 5
    @defense = 5
    @cry = "Shakaron Makaron!"
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

  def damage target, amount
    if target.current_health >-1
      if amount > @defense
        target.current_health= target.current_health - (amount - defense)
      end
    else puts target.name.to_s + " is dead.... Don't do that!"
    end
  end

  def fullheal
    @current_health = @max_health
  end
    # defense and attack setters and getters
  def defense
    @defense
  end

  def defense= defense_points
    @defense = defense_points
  end

  def attack
    @attack
  end

  def attack= attack_points
    @attack = attack_points
  end

  def cry
    @cry
    if @current_health >-1
      puts @cry
    else puts Self.name.to_s + " is dead.... sorry!"
    end
    
  end

  def awesomeness
    @awesomeness
  end

  def awesomeness= new_awesomeness
    @awesomeness = new_awesomeness
  end
end


class Snorlax < Pokemon
  def initialize
    @name = "Snorlax"
    @max_health = 20
    @current_health = max_health
    @attack = 5
    @defense = 5
    @cry = "So, what is happening around me? I'd better go sleep..."
    @awesomeness = 100
  end

  def sleep
    puts self.name.to_s + " has nightmares! Omg! It attacks itself in sleep. -5 hp"
    damage self, @attack
  end

  def look 
    puts self.name.to_s + " has the I-have-no-idea look on his face. Saliva starts to slowly drip... His awesomeness drops"
    @awesomeness= @awesomeness - 5
  end  

  def motivate opponent
    puts self.name.to_s + " gets motivated! The opponent fears him and looses defense..."
    opponent.defense= opponent.defense - 5
  end

  def toxic_gas opponent
    puts opponent.name.to_s + " seems to smell something... he is choking!"
    damage opponent, self.attack*5
  end   
end


class Annoy < Pokemon
  def initialize
    @name = "IAmSoHopeless"
    @max_health = 20
    @current_health = max_health
    @attack = 5
    @defense = 3
    @cry = "Please do it for me! I have no idea how..."
    @powerPoints = 3
  end

  def powerPoints
    @powerPoints 
  end

  def ask
    puts self.name.to_s + " asks for help... Opponent feels pitty and stops paying attention... defense -5"
    opponent.defense= opponent.defense - 5
  end

  def guess
    puts self.name.to_s + " So... What exactly did you do here?"  
  end  

  def rubberBandToss opponent
    puts self.name.to_s + " Tosses a rubber band at his opponent! Although annoying, its not really effective"
    damage opponent, 1
  end

  def snore opponent
    puts self.name.to_s + " snores really loudly... his opponent wishes he could sleep and feels physical pain..."
    damage opponent, 3
  end

  def section_asshole_it opponent
    if @powerPoints > -1
      puts self.name.to_s + " is being a section asshole! (Nearly) fatal wound!"
      damage opponent, 10
      @powerPoints = @powerPoints - 1
    else 
      puts self.name.to_s + " cannot be an asshole any more... he lacks inspiration!"
    end
  end
end


class Machamp < Pokemon
  def initialize
    @name = "Punder"
    @max_health = 20
    @current_health = max_health
    @attack = 5
    @defense = 5
    @cry = "Me destroy me crash"
  end

  def pound opponent
    puts self.name.to_s + " pounds his opponent into ground. Drastic."
    damage opponent, 7
  end

  def angry opponent
    puts self.name.to_s + " looks really really angry. Opponent trembles in fear!"
    opponent.defense= opponent.defense - 5

  end  

  def laugh
    puts self.name.to_s + " laughts noisely. It is creepy."
  end
end

p1 = Snorlax.new
p2= Machamp.new

p1.cry
p2.cry

p1.sleep
p2.angry p1
p1.look
p2.laugh
p1.motivate p2
p2.pound p1
p1.toxic_gas p2
p1.toxic_gas p2
puts p2.name.to_s + " has fainted!" if p2.current_health < 1