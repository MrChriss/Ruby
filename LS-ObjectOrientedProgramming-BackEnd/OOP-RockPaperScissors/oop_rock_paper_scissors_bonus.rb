class Player
  attr_accessor :move, :name, :score, :move_history, :difficulty

  def initialize
    @score = 0
    @move_history = []
    set_name
    set_difficulty
  end
end

class Human < Player
  ALL_MOVES = []

  def set_name
    n = ''
    loop do
      puts "What's your name?"
      n = gets.chomp
      break unless n.empty?
      puts "Sorry, enter a value."
    end
    self.name = n
  end

  def choose
    choice = nil
    loop do
      puts "Please choose rock, paper, scissors, lizard or spock:"
      choice = gets.chomp
      break if Move::VALUES.include? choice
      puts "Sorry, invalid choice"
    end
    self.move = Move.new(choice)
    move_history << choice
    ALL_MOVES << choice
  end

  def set_difficulty
    "depend on your own skill"
  end
end

class Computer < Player
  def set_name
    self.name = ['R2D2', 'Hal', 'Chappie', 'Sonny', 'Number 5'].sample
  end

  def set_difficulty
    puts "Set the difficulty from 1 to 100"
    puts "100 being 100% chance computer will counter your move,"
    puts "and 1 being computer selecting at random."
    answer = nil

    loop do
      answer = gets.chomp.to_i
      break if (1..100).cover? answer
      puts "You must choose a number between 1 and 100!"
    end

    self.difficulty = answer
  end

  def choose(arr)
    choice = Move.new(arr.sample)
    move_history << choice.value
    self.move = choice
  end

  # def track_human_gameplay
  #   human_moves = {}
  #   Human::ALL_MOVES.each do |move|
  #     human_moves[move] = Human::ALL_MOVES.count(move)
  #   end
  #
  #   human_moves
  #   defend_against = track_human_gameplay.invert.to_a.sort.last.last
  # end

  def calculate_choice(toughness)
    chance = rand(1..100)
    if (1..toughness).cover? chance
      counter = Human::ALL_MOVES.last
    else
      return choose(Move::VALUES)
    end

    case counter
    when 'rock'
      choose(['paper', 'spock'])
    when 'paper'
      choose(['scissors', 'lizard'])
    when 'scissors'
      choose(['rock', 'spock'])
    when 'lizard'
      choose(['scissors', 'rock'])
    when 'spock'
      choose(['paper', 'lizard'])
    end
  end
end

class Move
  VALUES = ['rock', 'paper', 'scissors', 'lizard', 'spock']
  attr_reader :value

  def initialize(value)
    @value = value
  end

  def scissors?
    @value == 'scissors'
  end

  def rock?
    @value == 'rock'
  end

  def paper?
    @value == 'paper'
  end

  def lizard?
    @value == 'lizard'
  end

  def spock?
    @value == 'spock'
  end

  def >(other_move)
    (rock? && other_move.scissors?) ||
      (paper? && other_move.rock?) ||
      (scissors? && other_move.paper?) ||
      (rock? && other_move.lizard?) ||
      (paper? && other_move.spock?) ||
      (scissors? && other_move.lizard?) ||
      (lizard? && other_move.spock?) ||
      (lizard? && other_move.paper?) ||
      (spock? && other_move.rock?) ||
      (spock? && other_move.scissors?)
  end

  def <(other_move)
    (rock? && other_move.paper?) ||
      (paper? && other_move.scissors?) ||
      (scissors? && other_move.rock?) ||
      (rock? && other_move.spock?) ||
      (paper? && other_move.lizard?) ||
      (scissors? && other_move.spock?) ||
      (lizard? && other_move.scissors?) ||
      (lizard? && other_move.rock?) ||
      (spock? && other_move.lizard?) ||
      (spock? && other_move.paper?)
  end

  def to_s
    @value
  end
end

class RPSGame
  attr_accessor :human, :computer

  def initialize
    @human = Human.new
    @computer = Computer.new
  end

  def display_welcome_message
    puts "Welcome to Rock, Paper, Scissors!"
  end

  def display_goodbye_message
    puts "Thank you for playing Rock, Paper, Scissors. Good bye!"
  end

  def display_moves
    puts "#{human.name} chose #{human.move}."
    puts "#{computer.name} chose #{computer.move}."
  end

  def display_winner
    if human.move > computer.move
      puts "#{human.name} won!"
      human.score += 1
    elsif human.move < computer.move
      puts "#{computer.name} won!"
      computer.score += 1
    else
      puts "It's a tie."
    end
  end

  def play_again?
    answer = nil
    loop do
      puts "Would you like to play again? (y/n)"
      answer = gets.chomp
      break if ['y', 'n'].include? answer.downcase
      puts "Sorry, must be y or n."
    end

    return false if answer.downcase == 'n'
    return true if answer.downcase == 'y'
  end

  def display_score
    puts ""
    puts "---- SCORE ----"
    puts "#{human.name}: #{human.score}"
    puts "#{computer.name}: #{computer.score}"
    puts ""
  end

  def display_move_history
    counter = 1
    puts ""
    puts "---- MOVE HISTORY ----"
    puts "#{human.name}:"
    human.move_history.each do |move|
      puts "#{counter}. #{move}"
      counter += 1
    end
    counter = 1
    puts "#{computer.name}:"
    computer.move_history.each do |move|
      puts "#{counter}. #{move}"
      counter += 1
    end
    puts ""
  end

  def play
    display_welcome_message
    loop do
      loop do
        human.choose
        computer.calculate_choice(computer.difficulty)
        display_moves
        display_winner
        break if human.score == 10 || computer.score == 10
      end
      display_score
      display_move_history
      if play_again?
        initialize
      else
        break
      end
    end
    display_goodbye_message
  end
end

RPSGame.new.play
