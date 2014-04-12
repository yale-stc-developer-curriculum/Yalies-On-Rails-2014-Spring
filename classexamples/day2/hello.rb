# puts "Are you hungry?"
# hungry = gets.chomp
# puts "Do we have any food?"
# havefood = gets.chomp

puts "Say please"
whatisaid = gets.chomp
while(whatisaid != "please")
  puts "Say please"
  whatisaid = gets.chomp
end

# if(hungry == "no")
# 	puts "get out of the kitchen. :|"
# elsif(hungry == "yes")
# 	puts "Do we have any food?"
# 	havefood = gets.chomp
# 	if(havefood == "yes")
# 		puts "eat something! :)"
# 	elsif(havefood == "no")
# 		puts "So sorry honey..."
# 	end
# end

# if(hungry == "yes" && havefood == "yes")
# 	puts "eat something! :)"
# elsif(hungry == "yes" && havefood == "no")
# 	puts "I'm so sorry honey, I haven't been to the store"
# elsif(hungry == "no")
# 	puts "get out of the kitchen. :|"
# else
# 	puts "what did you say?"
# end