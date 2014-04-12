class Die

  def roll
    @sideFacingUp = 1 + rand(6)
  end

  def whichsideisup
    @sideFacingUp
  end
end

adieobject = Die.new

##  Let's make a couple of dice...
#dice = [Die.new, Die.new]

##  ...and roll them.
#dice.each do |die|
  #puts die.roll
#end
