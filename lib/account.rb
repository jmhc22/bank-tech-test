class Account
  attr_reader :current_balance
  def initialize(initial_balance: 0 )
    @current_balance = initial_balance
  end

  def deposit(amount:)
    @current_balance += amount
  end

  def withdraw(amount:)
    unless amount_available?(amount)
      @current_balance -= amount
    else
      raise('Insufficient funds')
    end
  end

  private

  def amount_available?(amount)
    amount > @current_balance
  end
end
