class Account
  attr_reader :current_balance
  def initialize(initial_balance: 0, transaction_class: Transaction )
    @current_balance = initial_balance
    @transaction_class = transaction_class
  end

  def deposit(amount:)
    @current_balance += @transaction_class.new(amount: amount, balance: @current_balance).deposit
  end

  def withdraw(amount:)
    unless amount_available?(amount)
      @current_balance += @transaction_class.new(amount: amount, balance: @current_balance).withdrawal
    else
      raise('Insufficient funds')
    end
  end

  private

  def amount_available?(amount)
    amount > @current_balance
  end
end
