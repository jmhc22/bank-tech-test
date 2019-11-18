require 'date'
require_relative 'transaction'
require_relative 'statement'

class Account
  attr_reader :current_balance, :transaction_log
  def initialize(initial_balance: 0, transaction_class: Transaction, statement: Statement.new)
    @current_balance = initial_balance
    @statement = statement
    @transaction_class = transaction_class
    @transaction_log = []
  end

  def deposit(amount:, date: Date.today)
    transaction = @transaction_class.new(amount: amount, balance: @current_balance, date: date)
    process(transaction.deposit, transaction)
  end

  def withdraw(amount:, date: Date.today)
    raise('Insufficient funds') if amount_unavailable?(amount)
    transaction = @transaction_class.new(amount: amount, balance: @current_balance, date: date)
    process(transaction.withdrawal, transaction)
  end

  def print_statement
    print @statement.generate_statement(@transaction_log)
  end

  private

  def amount_unavailable?(amount)
    amount > @current_balance
  end

  def process(amount, transaction)
    @current_balance += amount
    @transaction_log.push(transaction)
  end
end
