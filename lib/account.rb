class Account
  attr_reader :current_balance
  def initialize(initial_balance: 0 )
    @current_balance = initial_balance
  end

  def deposit(amount:)
    @current_balance += amount
  end

end
