maxnumber = 10
mynumber = rand(maxnumber) + 1

def prompt_user(max)
  puts "guess a number between 1 and " + max.to_s
  return gets.chomp.to_i
end


guessednumber = prompt_user(maxnumber)
while(guessednumber != mynumber)
  if guessednumber > mynumber
	puts "too high"
  elsif guessednumber < mynumber
	puts "too low"
  end
  guessednumber = prompt_user(maxnumber)
end


puts "congratulations!"