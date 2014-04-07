puts "Rock, paper or scissors"
answer = gets.chomp

random = rand(3)
if random == 0
  computeranswer = 'rock'
  puts "computer chose rock"
elsif random == 1
  computeranswer = 'paper'
  puts "computer chose paper"
elsif random == 2
  computeranswer = 'scissors'
  puts "computer chose scissors"
end


#def whowins answer computeranswer
  if answer == 'rock'
    if computeranswer == 'rock'
      puts "draw"
    elsif computeranswer == 'paper'
      puts "lose"
    elsif computeranswer == 'scissors'
      puts "win!"
    end
  elsif answer == 'paper'
    if computeranswer == 'rock'
      puts "win!"
    elsif computeranswer == 'paper'
      puts "draw"
    elsif computeranswer == 'scissors'
      puts "lose..."
    end
  elsif answer == 'scissors'
    if computeranswer == 'rock'
      puts "lose"
    elsif computeranswer == 'paper'
      puts "win!"
    elsif computeranswer == 'scissors'
      puts "draw"
    end
  end
#end
