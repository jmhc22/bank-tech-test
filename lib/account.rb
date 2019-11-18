class Account
  attr_reader :current_balance
  def initialize(initial_balance: 0 )
    @current_balance = initial_balance
  end

  def deposit(amount:)
    @current_balance += amount
  end

  def withdraw(amount:)
    unless amount > @current_balance
      @current_balance -= amount
    else
      raise('Insufficient funds')
    end
  end

end
