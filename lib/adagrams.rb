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
puts "#{BIG_BAG}"
