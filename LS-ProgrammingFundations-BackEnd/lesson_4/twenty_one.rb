require 'pry'

SUITS = ["heart", "club", "diamond", "spades"]

ONE_SUIT = {
  "two" => 2,
  "three" => 3,
  "four" => 4,
  "five" => 5,
  "six" => 6,
  "seven" => 7,
  "eight" => 8,
  "nine" => 9,
  "ten" => 10,
  "jack" => 10,
  "queen" => 10,
  "king" => 10,
  "ace" => 11
}

DECK = {}
# generates deck, with 4 suits
def generate_deck(suits, one_suit, deck)
  suits.select do |suit|
    deck[suit] = {}
    one_suit.select do |key, value|
      deck[suit][suit + " " + key] = value
    end
  end
end

generate_deck(SUITS, ONE_SUIT, DECK)

def prompt(message)
  puts "=> #{message}"
end

# checks if the card has already been delt
def valid_card(cards_in_game, generated_card)
  cards_in_game.include?(generated_card)
end

def generate_card(deck_of_cards, cards_in_game)
  # generates random card from a deck of 52 cards, 4 suits
  loop do
    card = deck_of_cards.values.sample.to_a.sample

    if !valid_card(cards_in_game, card)
      cards_in_game.push(card)
      return card
    else
      next
    end
  end
end

def deal_to_participant(card, hand)
  hand.push(card)
end

def display_hand(cards_in_hand, participant)
  prompt "#{participant} cards:"
  cards_in_hand.each do |card|
    prompt "#{card[0]}(#{card[1]})"
  end
end

def evaluate_dealer(dealer_cards, score)
  score[:dealer_points] = 0
  dealer_cards.each do |value|
    if value[1] == 11 && score[:dealer_points] + value[1] > 21
      value[1] = 1
      score[:dealer_points] += 1
    else
      score[:dealer_points] += value[1]
    end
  end
end

def evaluate_player(player_cards, score)
  score[:player_points] = 0
  player_cards.each do |value|
    if value[1] == 11 && score[:player_points] + value[1] > 21
      value[1] = 1
      score[:player_points] += 1
    else
      score[:player_points] += value[1]
    end
  end
end

def over_21?(score)
  score.values.each do |value|
    if value > 21
      return true
    elsif value <= 21
      next
    end
  end
  false
end

def display_winner(score)
  # when both players stay, and nobody busts
  if score[:dealer_points] <= 21 && score[:player_points] <= 21
    if score[:dealer_points] < score[:player_points]
      "Player won with #{score[:player_points]} points."
    elsif score[:dealer_points] > score[:player_points]
      "Dealer won with #{score[:dealer_points]} points."
    else
      'Nobody won, you have same amount of points!'
    end
  # when one of the players busts
  elsif score[:dealer_points] > 21
    'Player won, Dealer busts!'
  elsif score[:player_points] > 21
    'Dealer won, Player busts!'
  end
end

def track_wins(score, wins)
  wins[:rounds] += 1
  # when both players stay, and nobody busts
  if score[:dealer_points] <= 21 && score[:player_points] <= 21
    if score[:dealer_points] < score[:player_points]
      wins[:player_wins] += 1
    elsif score[:dealer_points] > score[:player_points]
      wins[:dealer_wins] += 1
    end
  # when one of the players busts
  elsif score[:dealer_points] > 21
    wins[:player_wins] += 1
  elsif score[:player_points] > 21
    wins[:dealer_wins] += 1
  end
end

def display_wins(wins)
  prompt "Player wins: #{wins[:player_wins]}, " \
         "Dealer wins: #{wins[:dealer_wins]}, " \
         "Total rounds: #{wins[:rounds]}."
end

def reset_wins(wins)
  wins[:player_wins] = 0
  wins[:dealer_wins] = 0
  wins[:rounds] = 0
end

def end_game_message(dealer_cards, player_cards, score)
  puts "\n\n\n#{display_winner(score)} \n\n"
  display_hand(dealer_cards, 'Dealer')
  prompt "with #{score[:dealer_points]} points.\n\n"
  display_hand(player_cards, 'Player')
  prompt "with #{score[:player_points]} points.\n\n"
end

wins = {
  player_wins: 0,
  dealer_wins: 0,
  rounds: 0
}

loop do
  cards_in_game = []

  dealer_hand = []
  player_hand = []

  record = {
    player_points: 0,
    dealer_points: 0
  }
  2.times do # dealer and player each get 2 cards
    deal_to_participant(generate_card(DECK, cards_in_game), player_hand)
    deal_to_participant(generate_card(DECK, cards_in_game), dealer_hand)
  end

  evaluate_player(player_hand, record)
  evaluate_dealer(dealer_hand, record)

  prompt "Dealer has: #{dealer_hand[0][0]}(#{dealer_hand[0][1]})\n\n"
  display_hand(player_hand, 'Player')

  # players turn starts
  loop do
    puts "\n"
    prompt "Hit(1), or stay(2)?"
    answer = ''

    # checking for correct input
    loop do
      answer = gets.chomp
      break if answer == '1' || answer == '2'
      prompt "Type '1' to hit or '2' to stay."
    end

    # handels players response
    if answer == '1'
      deal_to_participant(generate_card(DECK, cards_in_game), player_hand)
      evaluate_player(player_hand, record)
      display_hand(player_hand, 'Player')
      if over_21?(record)
        end_game_message(dealer_hand, player_hand, record)
        track_wins(record, wins)
        display_wins(wins)
        break
      end
    else
      break
    end
  end
  # skips computer turn in case player has already lost
  if over_21?(record) && !wins[:dealer_wins]
    next
  elsif wins[:dealer_wins] == 5 && over_21?(record)
    prompt "Dealer won this session!"
    prompt "Would you like to play another game? (y for yes)"
    another_game = gets.chomp
    if another_game.downcase[0] == 'y'
      reset_wins(wins)
      next
    else
      break
    end
  end

  prompt "its computers turn now..."

  loop do
    if record[:dealer_points] <= 17 # computer hits
      deal_to_participant(generate_card(DECK, cards_in_game), dealer_hand)
      evaluate_dealer(dealer_hand, record)
      if over_21?(record)
        end_game_message(dealer_hand, player_hand, record)
        track_wins(record, wins)
        display_wins(wins)
        break
      end
    else # computer stays
      end_game_message(dealer_hand, player_hand, record)
      track_wins(record, wins)
      display_wins(wins)
      break
    end
  end

  # handles end of game citeria, offers another game
  if wins[:dealer_wins] == 5
    prompt "Dealer won this session!"
    prompt "Would you like to play another game? (y for yes)"
    another_game = gets.chomp
    if another_game.downcase[0] == 'y'
      reset_wins(wins)
      next
    else
      break
    end
  elsif wins[:player_wins] == 5
    prompt "Player won this session!"
    prompt "Would you like to play another game? (y for yes)"
    another_game = gets.chomp
    if another_game.downcase[0] == 'y'
      reset_wins(wins)
      next
    else
      break
    end
  else
    next
  end
end

prompt "Thank you for playing 21!" \
       " Good bye."
