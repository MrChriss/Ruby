require 'pry'

WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] +
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] +
                [[1, 5, 9], [3, 5, 7]].freeze
INITIAL_MARKER = " ".freeze
PLAYER_MARKER = "X".freeze
COMPUTER_MARKER = "O".freeze
MOVE_ORDER = 'choose'.freeze

def prompt(message)
  puts "=> #{message}"
end

if MOVE_ORDER == 'choose'
  prompt "Would you like to go first(1), or second (2)?"
  order = ''
  loop do
    order = gets.chomp
    if order.include?("1") || order.include?("2")
      ORDER = order
      break
    else
      prompt "Input 1 to go first or 2 to go second."
    end
  end
end

# rubocop:disable Metrics/AbcSize
def display_board(brd)
  system 'clear'
  puts "You're a #{PLAYER_MARKER}. Computer is #{COMPUTER_MARKER}."
  puts "     |     |"
  puts "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}"
  puts "     |     |"
  puts ""
  puts ""
end
# rubocop:enable Metrics/AbcSize

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

def player_places_piece!(brd)
  square = ''
  loop do
    joinor(empty_squares(brd), ', ', 'or')
    square = gets.chomp.to_i
    break if empty_squares(brd).include?(square)
    prompt "Not valid input"
  end
  brd[square] = PLAYER_MARKER
end

def find_at_risk_square(brd, line, marker)
  if brd.values_at(*line).count(marker) == 2
    brd.select do |key, value|
      line.include?(key) && value == INITIAL_MARKER
    end.keys.first
  else
    nil
  end
end

def computer_places_piece!(brd)
  square = nil
  # offence first
  WINNING_LINES.each do |line|
    square = find_at_risk_square(brd, line, COMPUTER_MARKER)
    break if square
  end
  # defence second
  if !square
    WINNING_LINES.each do |line|
      square = find_at_risk_square(brd, line, PLAYER_MARKER)
      break if square
    end
  end
  # pick square number 5
  square = 5 if brd[5] == INITIAL_MARKER
  # else pick at random
  square = empty_squares(brd).sample if !square

  brd[square] = COMPUTER_MARKER
end

def board_full?(brd)
  empty_squares(brd).empty?
end

def someone_won?(brd)
  !!detect_winner(brd)
end

def detect_winner(brd)
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(PLAYER_MARKER) == 3
      return 'Player'
    elsif brd.values_at(*line).count(COMPUTER_MARKER) == 3
      return 'Computer'
    end
  end
  nil
end

def joinor(arr, separator, word)
  all_but_last = arr[0..(arr.length - 2)]
  last_one = arr.last.to_s
  if arr.length > 1
    prompt "Choose a square: #{all_but_last.join(separator)} " \
           "#{word} " + last_one
  else
    prompt "Choose a square: #{all_but_last.join(separator)}."
  end
end

def display_score(score_chart)
  prompt "Score:
   Player:   #{score_chart[:human_wins]}
   Computer: #{score_chart[:comp_wins]}
   Draws:    #{score_chart[:draws]}\n\n\n"
end

score = {
  human_wins: 0,
  comp_wins: 0,
  draws: 0,
  round: 0
}

def display_interface(brd, score_chart)
  display_board(brd)
  display_score(score_chart)
end

def current_player_places_piece!(brd, order)
  if brd.values.count(PLAYER_MARKER) < brd.values.count(COMPUTER_MARKER)
    player_places_piece!(brd)
  elsif brd.values.count(PLAYER_MARKER) > brd.values.count(COMPUTER_MARKER)
    computer_places_piece!(brd)
  # in case there are equal number of both markers, look for order of moves
  else
    if order == "1"
      player_places_piece!(brd)
    else
      computer_places_piece!(brd)
    end
  end
end

loop do
  if score[:human_wins] >= 5 || score[:comp_wins] >= 5
    prompt "Play again?(y/n)"
    answer = gets.chomp
    break unless answer.downcase.start_with?('y')
    score = {
      human_wins: 0,
      comp_wins: 0,
      draws: 0,
      round: 0
    }
  end

  board = initialize_board

  loop do
    display_interface(board, score)

    current_player_places_piece!(board, ORDER)
    display_interface(board, score)
    break if someone_won?(board) || board_full?(board)
  end

  if someone_won?(board)
    system 'clear'
    prompt "#{detect_winner(board)} won!"
  else
    prompt "It's a tie!"
  end

  case detect_winner(board)
  when "Player"
    score[:human_wins] += 1
  when "Computer"
    score[:comp_wins] += 1
  when nil
    score[:draws] += 1
  end
  score[:round] += 1
end

prompt 'Thanks for playing Tic Tac Toe, Good bye!'

# if ORDER == "1"
#   player_places_piece!(board)
#   display_interface(board, score)
#   break if someone_won?(board) || board_full?(board)

#   computer_places_piece!(board)
#   display_interface(board, score)
#   break if someone_won?(board) || board_full?(board)
# elsif ORDER == "2"
#   computer_places_piece!(board)
#   display_interface(board, score)
#   break if someone_won?(board) || board_full?(board)

#   player_places_piece!(board)
#   display_interface(board, score)
#   break if someone_won?(board) || board_full?(board)
# end
