# puts "Welcome to Katillac's wave 1 adagram game."
#
#  BANANA_BAG =[ {"A" => 9}, {"B" => 2}, {C: 2}, {D: 4}, {E: 12}, {F: 2}, {G: 3}, {H: 2}, {I: 9}, {J: 1}, {K: 1}, {L: 4}, {M: 2}, {N: 6}, {O: 8}, {P: 2}, {Q: 1}, {R: 6}, {S: 4}, {T: 6}, {U: 4}, {V: 2}, {W: 2}, {X: 1}, {Y: 2}, {Z: 1} ]
#  #puts BANANA_BAG

# def making_tiles(array_of_hashes)
#   letters = []
#   array_of_hashes[2] do | key, value | #should go thru entire after testing
#     letter = key
#     return letter
#   end
# end
#
# puts making_tiles(BANANA_BAG)

#puts BANANA_BAG[0][:A] #this returns the value

# letter =  BANANA_BAG[0].keys
# puts "#{letter}"

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

# puts "#{BIG_BAG}"
print "What word would you like to make with those letters? "
word = gets.chomp.to_s.upcase.chars

#puts "#{word}"
reverse_word = word.reverse
#puts "#{reverse_word}"


#does last letter of the word match a tile from the bag
# reverse_word.each_with_index do |index|
#   if drawn_hand.include?(reverse_word.last)
#     puts "yay!"
#     drawn_hand.delete(word[-1])
#     word.pop
#   else
#     puts "sorry no match"
#     # exit
#   end
# end
#
#   puts "#{word}"
#   puts "#{drawn_hand}"


#does last letter of the word match a tile from the bag
def uses_available_letters? (input, letters_in_hand)
  user_correct = true
  input.each_with_index do |index|
    if letters_in_hand.include?(input.last)
      letters_in_hand.delete(input[0])
      origional_word = input.reverse
      origional_word.pop
      user_correct = true
    else
      user_correct = false
      # exit
    end
  end
return user_correct
end

# if user_correct
#   return true
# else
#   return false

test = uses_available_letters?(reverse_word, drawn_hand)
puts test


# puts "#{word}"
# puts "#{drawn_hand}"
# puts user_correct
