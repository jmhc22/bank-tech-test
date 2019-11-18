require 'date'

class Transaction
  attr_reader :balance, :date, :credit, :debit
  def initialize(amount:, balance:, date: Date.today)
    @amount = amount
    @balance = balance
    @date = date
  end

  def deposit
    @credit ||= @amount
    @debit ||= false
    calculate_balance
  end

  def withdrawal
    @debit = @amount * -1
    @credit ||= false
    calculate_balance
  end

  private

  def calculate_balance
    @balance += (@debit || 0) + (@credit || 0)
    @amount = 0
    return @credit || @debit
  end
end
