OPTIONS = %w(rock paper scissors)

def prompt(message)
  Kernel.puts("=> #{message}")
end

def win?(first, second)
  (first == 'rock' && second == 'scissors') ||
    (first == 'paper' && second == 'rock') ||
    (first == 'scissors' && second == 'paper')
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

prompt('Welcome to rock paper scissors game.')
prompt('You will be playing agains me, your favorite computer')

loop do
  prompt('Rock, paper or scissors?')
  answer = ''

  loop do
    answer = Kernel.gets().chomp().downcase()
    if OPTIONS.include?(answer)
      break
    else
      prompt("Invalid input! Valid choices are: #{OPTIONS.join(', ')}.")
    end
  end

  computer_choice = OPTIONS.sample()

  print_result(answer, computer_choice)

  prompt('Care for another?(Y for yes / other for no)')
  another_go = Kernel.gets().chomp()
  break unless another_go.downcase().start_with?('y')
end

prompt('Thanks for playing, good bye!')
