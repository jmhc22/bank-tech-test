# frozen_string_literal: true

require 'date'

class Transaction
  attr_reader :incurred_balance, :date, :credit, :debit
  def initialize(amount:, balance:, type:, date: Date.today)
    @incurred_balance = balance
    method(type).call(amount)
    @date = date
  end

  private

  def deposit(amount)
    @credit = amount
    calculate_balance
  end

  def withdrawal(amount)
    @debit = amount * -1
    calculate_balance
  end

  def calculate_balance
    @incurred_balance += (@debit || 0) + (@credit || 0)
  end
end
