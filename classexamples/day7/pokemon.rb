class Pokemon

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
    @current_health = @current_health - amount
  end

  def fullheal
    @current_health = @max_health
  end

end

p = Pokemon.new
p.name= "Bulbasaur"
p.max_health= 24
p.current_health= 24
p.damage 4
p
p.damage 4
p
p.damage 4
p
p.damage 4
p


class Kakuna < Pokemon
  def harden
    #lol nothing
  end
end

class Pikachu < Pokemon
  def thundershock otherpokemon
    otherpokemon.damage 10
  end
  def tackle otherpokemon
    otherpokemon.damage 10
  end
  def recover
    #recoverme
  end
end
