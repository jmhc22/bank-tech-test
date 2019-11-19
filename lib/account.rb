# frozen_string_literal: true

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
    process(
      @transaction_class.new(amount: amount, balance: @current_balance, type: :deposit, date: date)
    )
  end

  def withdraw(amount:, date: Date.today)
    raise('Insufficient funds') if amount_unavailable?(amount)

    process(@transaction_class.new(amount: amount, balance: @current_balance, type: :withdrawal, date: date))
  end

  def print_statement
    print @statement.generate_statement(@transaction_log)
  end

  private

  def amount_unavailable?(amount)
    amount > @current_balance
  end

  def process(transaction)
    @current_balance = transaction.incurred_balance
    @transaction_log.push(transaction)
  end
end
