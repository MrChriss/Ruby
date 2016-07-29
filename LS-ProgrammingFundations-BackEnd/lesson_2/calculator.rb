require 'yaml'
MESSAGES = YAML.load_file('calculator_messages.yml')

def prompt(message)
  Kernel.puts("=> #{message}")
end

# improved validation for num input
def valid_input(num)
  if num.to_i().to_s() == num
    return true
  elsif num.to_f().to_s() == num
    return true
  else
    return false
  end
end

def operation_performing(op)
  word = case op
         when '1'
          MESSAGES['add']
         when '2'
          MESSAGES['subtract']
         when '3'
          MESSAGES['multiply']
         when '4'
          MESSAGES['divide']
         end
  word
end

prompt(MESSAGES['welcome'])
# prompt('Welcome to the calculator! Enter your name:')

name = ''
loop do
  name = Kernel.gets().chomp()

  if name.empty?()
    prompt(MESSAGES['valid_name'])
    #prompt('Enter a valid name')
  else
    break
  end
end

prompt(MESSAGES['greeting_name'] + name)
#prompt("Hi, #{name}")

loop do
  num_1 = ''
  loop do
    prompt(MESSAGES['first_num'])
    #prompt('Input the first number.')
    num_1 = Kernel.gets().chomp()

    if valid_input(num_1)
      break
    else
      prompt(MESSAGES['invalid_num'])
      #prompt('You didnt choose a number!')
    end
  end

  num_2 = ''
  loop do
    prompt(MESSAGES['second_num'])
    #prompt('Input the second number.')
    num_2 = Kernel.gets().chomp()

    if valid_input(num_2)
      break
    else
      prompt(MESSAGES['invalid_num'])
      #prompt('You didnt choose a number!')
    end
  end

  # prompt(MESSAGES['operation_select'])
=begin  operator_prompt = <<-MSG
  Input the operation, you wish to perform:
  1) add
  2) subtract
  3) multiply
  4) divide
  MSG
=end

  prompt(MESSAGES['operation_select'])

  operation = ''
  loop do
    operation = Kernel.gets().chomp()

    if %w(1 2 3 4).include?(operation)
      break
    else
      prompt(MESSAGES['invalid_operation'])
      #prompt('Choose whitin the specified range please.')
    end
  end

  prompt("#{operation_performing(operation)}" + MESSAGES['processing'])
  #prompt("#{operation_performing(operation)} numbers...")
  result = case operation
           when '1'
             num_1.to_f() + num_2.to_f()
           when '2'
             num_1.to_f() - num_2.to_f()
           when '3'
             num_1.to_f() * num_2.to_f()
           when '4'
             num_1.to_f() / num_2.to_f()
           end

  if num_2 == '0' && operation == '4'
    prompt(MESSAGES['zero_division_e'])
    #prompt('Division by zero error!')
  else
    prompt(MESSAGES['result'] + result.to_s)
    #prompt("Result is #{result}")
  end

  prompt(MESSAGES['another_go'])
  #prompt('Perform another operation?(Y for yes /other for no)')

  another = Kernel.gets().chomp()
  break unless another.downcase().start_with?('y')
end

prompt(MESSAGES['goodbye_msg'] + name)
#prompt("Thanks for using the calculator, #{name}.\n Good bye!")
