def prompt(message)
  Kernel.puts("=> #{message}")
end

prompt('Welcome to Mortgage / Car Loan Calculator!')

loop do
  prompt('Input the loan amount.')
  loan = ''

  loop do
    loan = Kernel.gets().chomp()

    if loan.empty? || loan.to_f < 0 ||
       !(loan.to_i().to_s() == loan)
      prompt('You must enter a positive sum')
    else
      break
    end
  end

  prompt('Input the annual percentage rate.')

  apr = ''
  loop do
    apr = Kernel.gets().chomp()

    if apr.empty? || apr.to_f < 0 ||
       !(apr.to_i().to_s() == apr)
      prompt('You must enter percentage e.g. (33)')
    else
      break
    end
  end

  prompt("Input the loan duration in years.")

  duration = ''
  loop do
    duration = Kernel.gets().chomp()

    if duration.empty? || duration.to_f < 0 ||
       !(duration.to_i().to_s() == duration)
      prompt('Enter correct time duration')
    else
      break
    end
  end

  apr = apr.to_f() / 100
  m_interest_rate = apr.to_f() / 12
  m_duration = duration.to_i() * 12
  m_payment = loan.to_f() *
              (m_interest_rate /
              (1 - (1 + m_interest_rate)**-m_duration))

  prompt("Monthly interest rate is:
        #{format('%02.2f', m_interest_rate * 100)}%")
  prompt("You will need to pay
        $#{format('%02.2f', m_payment)}$ per month, for #{m_duration} months.")

  prompt('Would you like to perform another operation?
        (y for yes, other for no)')
  answer = Kernel.gets().chomp()

  break unless answer.downcase().start_with?('y')
end
