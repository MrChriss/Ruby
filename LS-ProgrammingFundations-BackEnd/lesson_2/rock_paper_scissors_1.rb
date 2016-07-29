OPTIONS = ['rock', 'paper', 'scissors']

def prompt(message)
  Kernel.puts("=> #{message}")
end

def print_result(human, computer)
  case human
  when 'rock'
    if computer == 'paper'
      prompt("I pick: #{computer}, you lose!")
    elsif computer == 'scissors'
      prompt("I pick: #{computer}, you win!")
    else
      prompt("I pick: #{computer}, it's a draw!")
    end
  when 'scissors'
    if computer == 'paper'
      prompt("I pick: #{computer}, you win!")
    elsif computer == 'scissors'
      prompt("I pick: #{computer}, it's a draw!")
    else
      prompt("I pick: #{computer}, you lose!")
    end
  when 'paper'
    if computer == 'paper'
      prompt("I pick: #{computer}, it's a draw!")
    elsif computer == 'scissors'
      prompt("I pick: #{computer}, you lose!")
    else
      prompt("I pick: #{computer}, you win!")
    end
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
