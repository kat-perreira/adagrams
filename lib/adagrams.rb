#Wave 1

puts "Welcome to Katillac's Wave 1 Adagram Game."

BANANA_BAG =[ {"A" => 9}, {"B" => 2}, {"C" => 2}, {"D" => 4}, {"E" => 12}, {"F" => 2}, {"G" => 3}, {"H" => 2}, {"I" => 9}, {"J" => 1}, {"K" => 1}, {"L" => 4}, {"M" => 2}, {"N" => 6}, {"O" => 8}, {"P" => 2}, {"Q" => 1}, {"R" => 6}, {"S" => 4}, {"T" => 6}, {"U" => 4}, {"V" => 2}, {"W" => 2}, {"W"  => 1}, {"Y" => 2}, {"Z" => 1} ]

def making_tiles (array_of_hashes)
 bag = []
 letters = []
 values = []
 array_of_hashes.each do |hash|
   hash.each do |key, value|
     letters << key
     values << value
   end
   # puts values
 end
 26.times do |i|
   current_bag = letters[i] * values[i]
   bag << current_bag.split("")
 end

 return bag

end

test = making_tiles(BANANA_BAG)
BIG_BAG = test.flatten


def draw_letters
 hand = BIG_BAG.shuffle[0..9]
 return hand
end

drawn_hand = draw_letters
puts "You have drawn these letters: #{drawn_hand}"
puts

# Wave 2
print "What word would you like to make with those letters? "
word = gets.chomp.to_s.upcase

# Flips the word in reverse so we can "pop off" the last letter if it matches
reverse_word = word.reverse

def uses_available_letters? (input, letters_in_hand)
 user_array = input.chars
 user_array.each_with_index do |index|
   if letters_in_hand.include?(user_array.last)
     letters_in_hand.delete(input[0])
     origional_word = user_array.reverse
     origional_word.pop
   else
     return false
     # exit
   end
 end
return true
end

test = uses_available_letters?(word, drawn_hand)
puts test
