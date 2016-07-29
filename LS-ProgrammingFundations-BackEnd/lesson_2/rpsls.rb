OPTIONS = %w(rock paper scissors lizard spock)
require 'pry'

def prompt(message)
  Kernel.puts("=> #{message}")
end

record = {
  human_wins: 0,
  comp_wins: 0,
  draws: 0,
  games: 0
}

def win?(first, second)
  (first == '1' && second == '4') ||
    (first == '4' && second == '5') ||
    (first == '5' && second == '3') ||
    (first == '3' && second == '2') ||
    (first == '2' && second == '1') ||
    (first == '1' && second == '3') ||
    (first == '3' && second == '4') ||
    (first == '4' && second == '2') ||
    (first == '2' && second == '5') ||
    (first == '5' && second == '1')
end

def print_result(human, computer)
  if win?(human, computer)
    prompt('You win!')
  elsif win?(computer, human)
    prompt('You lose!')
  else
    prompt("It's a draw")
  end
end

def determine_winner(human, computer)
  if win?(human, computer)
    return 'human'
  elsif win?(computer, human)
    return 'computer'
  else
    return 'draw'
  end
end

def print_score(winner, score_hash)
  case winner
  when 'human'
    score_hash[:human_wins] += 1
  when 'computer'
    score_hash[:comp_wins] += 1
  when 'draw'
    score_hash[:draws] += 1
  end
  score_hash[:games] += 1
  prompt("You have played: #{score_hash[:games]} games. You won: #{score_hash[:human_wins]} times. Computer won #{score_hash[:comp_wins]} times. There were #{score_hash[:draws]} draws.")
end

prompt("Welcome to #{OPTIONS.join(', ')}.")
prompt('Rules are:
        Scissors cuts Paper,
        Paper covers Rock,
        Rock crushes Lizard,
        Lizard poisons Spock,
        Spock smashes Scissors,
        Scissors decapitates Lizard,
        Lizard eats Paper,
        Paper disproves Spock,
        Spock vaporises Rock,
        Rock crushes Scissors.')

loop do
  prompt("Chose one of the following: #{OPTIONS.join(', ')}")
  prompt("1 rock\n   2 paper\n   3 scissors\n   4 lizard\n   5 spock")

  answer = ''

  loop do
    answer = Kernel.gets().chomp()

    if answer.empty? ||
         !(answer.to_i().to_s() == answer) ||
         answer.to_i < 0 ||
         answer.to_i > 5
      prompt("Cooperate; input a num from 1 to 5")
    else
      prompt("You have chosen: #{OPTIONS[answer.to_i() - 1]}")
      break
    end
  end

  computer_choice = (OPTIONS.index(OPTIONS.sample()) + 1).to_s()
  prompt("I choose: #{OPTIONS[computer_choice.to_i() - 1]}")

  print_result(answer, computer_choice)

  print_score(determine_winner(answer, computer_choice), record)

  break if record[:comp_wins] >= 5 || record[:human_wins] >= 5
end
