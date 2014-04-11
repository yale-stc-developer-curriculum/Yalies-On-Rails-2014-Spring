#ahash = {"key" => "value"}
#person1 = {"name" => "Casey", "age" => 23, "favoritecolor" => "blue"}
#person2 = {"name" => "Dalton", "age" => 18, "favoritecolor" => "purple"}

#person1["name"]

"BK" 0
"BK" 1
"BK" 2

:BK 0
:BK 0
:BK 0


colleges = {"BR" => "Branford", "BK" => "Berkeley"}
colleges = {:BR => "Branford", :BK => "Berkeley"}
text = "Berkeley is the best I love BK, it's better than BR"

colloge[:BR]

puts text
["BR", "BK"].each_with_index do |abbrev, index|
  puts abbrev
  puts index
end
puts text


#"#{varname}"
name = "Casey"

puts "Hi my name is #{name}"
