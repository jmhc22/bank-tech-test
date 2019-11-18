class Account
  attr_reader :current_balance, :transaction_log
  def initialize(initial_balance: 0, transaction_class: Transaction )
    @current_balance = initial_balance
    @transaction_class = transaction_class
    @transaction_log = []
  end

  def deposit(amount:)
    transaction = @transaction_class.new(amount: amount, balance: @current_balance)
    process(transaction.deposit, transaction)
  end

  def withdraw(amount:)
    unless amount_available?(amount)
      transaction = @transaction_class.new(amount: amount, balance: @current_balance)
      process(transaction.withdrawal, transaction)
    else
      raise('Insufficient funds')
    end
  end

  private

  def amount_available?(amount)
    amount > @current_balance
  end

  def process(amount, transaction)
    @current_balance += amount
    @transaction_log.push(transaction)
  end
end
