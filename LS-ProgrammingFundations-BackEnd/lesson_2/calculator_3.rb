LANGUAGE = 'slo'

require 'yaml'
MESSAGES = YAML.load_file('calculator_messages.yml')

def messages(message, lang = 'en')
  MESSAGES[lang][message]
end

# adding another parameter var, for easyer enserting variables
# adding order, when variable needs to be displayed first
def prompt(key, var = '', order = nil)
  if order == 1
    message = var.to_s + messages(key, LANGUAGE)
  else
    message = messages(key, LANGUAGE) + var.to_s
  end
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
           messages('add', LANGUAGE)
         when '2'
           messages('subtract', LANGUAGE)
         when '3'
           messages('multiply', LANGUAGE)
         when '4'
           messages('divide', LANGUAGE)
         end
end

prompt('welcome')

name = ''
loop do
  name = Kernel.gets().chomp()

  if name.empty?()
    prompt('valid_name')
  else
    break
  end
end

prompt('greeting_name', name)

loop do
  num_1 = ''
  loop do
    prompt('first_num')
    num_1 = Kernel.gets().chomp()

    if valid_input(num_1)
      break
    else
      prompt('invalid_num')
    end
  end

  num_2 = ''
  loop do
    prompt('second_num')
    num_2 = Kernel.gets().chomp()

    if valid_input(num_2)
      break
    else
      prompt('invalid_num')
    end
  end

  prompt('operation_select')

  operation = ''
  loop do
    operation = Kernel.gets().chomp()

    if %w(1 2 3 4).include?(operation)
      break
    else
      prompt('invalid_operation')
    end
  end
  prompt('processing', operation_performing(operation), 1)
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
    prompt('zero_division_e')
  else
    prompt('result', result)
  end

  prompt('another_go')

  another = Kernel.gets().chomp()
  break unless another.downcase().start_with?('y')
end

prompt('goodbye_msg', name)
