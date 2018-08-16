#Wave 1
require 'pry'

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
# puts test

# Wave 3
POINTS = [
  {"A" => 1},
  {"B" => 3},
  {"C" => 3},
  {"D" => 2},
  {"E" => 1},
  {"F" => 4},
  {"G" => 2},
  {"H" => 4},
  {"I" => 1},
  {"J" => 8},
  {"K" => 5},
  {"L" => 1},
  {"M" => 3},
  {"N" => 1},
  {"O" => 1},
  {"P" => 3},
  {"Q" => 10},
  {"R" => 1},
  {"S" => 1},
  {"T" => 1},
  {"U" => 1},
  {"V" => 4},
  {"W" => 4},
  {"X" => 8},
  {"Y" => 4},
  {"Z" => 10}
]

def score_word(word)
  word_arr = word.upcase.chars
  score = 0
  POINTS.each do |hash|
    hash.each do |key, value|
      word_arr.each do |letter|
        if letter == key
          score = score + value
        end
      end
    end
  end
  # adds 8 points if the word guess is greater or equal to 7 digits
  if word.length >= 7
    score = score + 8
  end
  return score
end


# test_score = score_word(word)

# Wave 4

def highest_score_from (words)
  highest_scores = []
  scores = []

  words.each do |word|
    # calling method above (called score_hash) to create a hash with the particular word and score of each word in the array
    score_hash = {
      words: word,
      scores: score_word(word)
    }
    # shovelling the hashes above into the highest_scores array
    highest_scores << score_hash
    # shoveeling the return of the score_word method above (which is the score) for each of the words in the array
    scores << score_word(word)
  end

  # sorts the scores from the scores array above and then makes the changes "permanent" with the ! so we can use it in the below iterations.
  sorted_scores = scores.sort!
  winners_room = []
  winner_hash = {}
  # Iterating our way through the above array of hashes
  highest_scores.each do |hash|
    # Iterating through each of those hashes.  if the value of the score is equal to the highest member of the sorted_scores array (the largest), the word will then be shovelled into the winner array.

    if hash[:scores] == sorted_scores.last
      # putting all the winners with highest score to wait
      winners_room << hash[:words]

    end
    shortest_word = 11
    # going thru each player in the winners room to meet top winner
    actual_winner = []
    # actual_actual_winner = ""
    actual_actual_winner = []
    winners_room.each do |winner|
      if winner.length == 10
        actual_winner << winner


      elsif winner.length <= shortest_word
        shortest_word = winner.length
        actual_winner << winner

      end
      # actual_actual_winner = []
      actual_actual_winner << actual_winner[0]
    end
    # actual_actual_winner = ''
    #   actual_actual_winner = actual_winner.first
    #itterate thru the winner array to account for tie stuff
    # binding.pry
    winner_hash = {
      word: actual_actual_winner[0],
      score: sorted_scores.last
    }
  end
  return winner_hash
end
# binding.pry


# winner = highest_score_from(["dog", "cat", "battonsuens"])
# puts "#{winner}"
