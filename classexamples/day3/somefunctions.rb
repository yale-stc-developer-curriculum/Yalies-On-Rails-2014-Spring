def favoritenumber
  puts "lololololo" #does a side effect and the statement returns "lololololo" which is lost
  return 168 #ends the function and returns the value 168
end

somestorage = favoritenumber
#somestorage now contains 168

#def favoritenumber
  #168
#end


phrase = "sunshine and lollipops make the world go round"
puts phrase
def catchphrase
  puts "lololo"
  phrase = "do it or die."
end
puts phrase


#functions will stop running and return a value any time a return statement is hit
def doubleit num
  num = num * 2
  return num
  num = 3 #this line won't ever run
end

doubleit 2


def multiplythem numarray
  numarray.each do |num|
    #something
  end
end

multiplythem

#functions will always return the returned value of the last line
#using "return" isn't always necessary
#def doubleit num
  #num * 2
#end
