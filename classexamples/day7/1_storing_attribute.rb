
class Die

  def roll
    @numberShowing = 1 + rand(6)
  end

  def showing
    @numberShowing
  end
  def cheat makeitthisnumber
    @numberShowing = makeitthisnumber
  end
  def showing= makeitthisnumber
    @numberShowing = makeitthisnumber
  end

end

#die = Die.new
#die.roll
#puts die.showing
#puts die.showing
#die.roll
#puts die.showing
#puts die.showing

