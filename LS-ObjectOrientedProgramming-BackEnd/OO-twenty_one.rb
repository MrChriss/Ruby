module DeckAndCards
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

  def generate_deck(suits, one_suit, deck)
    suits.select do |suit|
      deck[suit] = {}
      one_suit.select do |key, value|
        deck[suit][suit + " " + key] = value
      end
    end
  end

  def generate_card
    suit = SUITS.sample
    card = DECK[suit].to_a.sample
    DECK[suit].delete(card.first)
    return card
  end
end

class Player
  include DeckAndCards
  attr_accessor :hand, :stay

  def initialize
    @hand = []
    @stay = false
  end

  def hit
    hand << generate_card
  end

  def stay!
    self.stay = true
  end

  def stay?
    stay
  end

  def display_hand
    if self.class == Human
      puts "+=== Your Hand ===+"
    else
      puts "+= Dealer's hand =+"
    end
    hand.each do |card|
      puts "#{card.first}: #{card.last}"
    end
    puts "+ - - - - - - - - +"
    puts "total of: #{points_in_hand}"
    puts "+=================+"
  end

  def points_in_hand
    points = 0
    hand.each do |card|
      value = card.last.to_i
      if points + value > 21 && value == 11
        card[1] = "1"
        points += 1
      else
        points += value
      end
    end

    points
  end
end

class Human < Player
  def move
    puts "Hit or stay?"
    answer = nil

    loop do
      answer = gets.chomp.downcase
      break if answer == 'hit' || answer == 'stay'
      puts "Invalid input!"
    end

    case answer
    when 'hit'
      hit
    when 'stay'
      stay!
    end
  end
end

class Computer < Player
  def move
    if points_in_hand <= 17
      hit
    else
      stay!
    end
  end

  def display_one_card
    puts "+=== Dealer's Hand ===+"
    puts "#{hand[0][0]}: #{hand[0][1]}"
    puts "+======================+"
  end
end

class Game
  include DeckAndCards
  attr_reader :human, :computer

  def initialize
    generate_deck(SUITS, ONE_SUIT, DECK)
    @computer = Computer.new
    @human = Human.new
  end

  def deal_cards
    2.times do
      human.hit
      computer.hit
    end
  end

  def over_21?(player)
    if player.points_in_hand > 21
      true
    else
      false
    end
  end

  def who_won(player1, player2)
    if over_21?(player1) ||
       player1.points_in_hand < player2.points_in_hand &&
       !over_21?(player2)
      player2
    elsif over_21?(player2) ||
          player1.points_in_hand > player2.points_in_hand &&
          !over_21?(player1)
      player1
    end
  end

  def display_welcome_message
    system 'clear'
    puts "+--- WELCOME ---+"
    puts "|               |"
    puts "| to: TwentyOne |"
    puts "|               |"
    puts "+---------------+"
    puts ""
  end

  def display_good_bye_message
    puts ""
    puts "+--- GOOD BYE ---+"
    puts "|                |"
    puts "|    Thanks      |"
    puts "|    for         |"
    puts "|    playing     |"
    puts "|                |"
    puts "+----------------+"
  end

  def display_winner(player)
    system 'clear' unless over_21?(human)
    puts ""
    puts "+---- RESULT ----+"
    if player == human
      puts "     You won"
    elsif player == computer
      puts "     Dealer won"
    else
      puts "    It's a draw"
    end
    puts "+----------------+"
    puts ""
  end

  def you_bust
    system 'clear'
    puts ""
    puts "+----- LOST -----+"
    puts "|                |"
    puts "|    You bust    |"
    puts "|                |"
    puts "+----------------+"
  end

  def play_again?
    puts ""
    puts "Play another game?(y/n)"
    answer = gets.chomp.downcase
    true if answer == 'y'
  end

  def play_another_game
    initialize
    system 'clear'
    puts "Let's play again!"
    puts ""
  end

  def play
    display_welcome_message

    loop do
      deal_cards

      loop do
        computer.display_one_card
        human.display_hand
        human.move
        break if over_21?(human) || human.stay?
      end
      if over_21?(human)
        you_bust
      else
        loop do
          computer.move
          break if over_21?(computer) || computer.stay?
        end
      end

      display_winner(who_won(human, computer))
      computer.display_hand
      human.display_hand
      break unless play_again?
      play_another_game
    end

    display_good_bye_message
  end
end

game = Game.new
game.play
