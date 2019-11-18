# frozen_string_literal: true

require 'transaction'
require 'date'

describe Transaction do
  describe '#deposit' do
    it 'a 200 deposit transaction will have a credit of 200 and debit of nil' do
      transaction = Transaction.new(amount: 200, balance: 1000, type: :deposit)
      expect(transaction.debit).to eq nil
      expect(transaction.credit).to eq 200
      expect(transaction.incurred_balance).to eq 1200
    end
  end

  describe '#withdrawal' do
    it 'a 500 withdrawal transaction has a debit of 500 and credit of nil' do
      transaction = Transaction.new(amount: 500, balance: 1000, type: :withdrawal)
      expect(transaction.debit).to eq(-500)
      expect(transaction.credit).to eq nil
      expect(transaction.incurred_balance).to eq 500
    end
  end

  describe '#date' do
    it 'a transaction will by default set the date variable to today' do
      transaction = Transaction.new(amount: 500, balance: 1000, type: :deposit)
      expect(transaction.date).to eq Date.today
    end

    it 'a transaction date can be overrided with a different date' do
      yesterday = Date.today - 1
      transaction = Transaction.new(amount: 500, balance: 1000, type: :deposit, date: yesterday)
      expect(transaction.date).to eq yesterday
    end
  end
end
