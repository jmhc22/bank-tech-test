require 'transaction'
require 'date'

describe Transaction do

  describe '#deposit' do
    it 'a 200 deposit transaction will have a credit of 200 and debit of nil' do
      transaction = Transaction.new(amount: 200, balance: 1000)
      transaction.deposit
      expect(transaction.debit).to eq false
      expect(transaction.credit).to eq 200
      expect(transaction.balance).to eq 1200
    end
  end

  describe '#withdrawal' do
    it 'a 500 withdrawal transaction will have a debit of 500 and credit of nil' do
      transaction = Transaction.new(amount: 500, balance: 1000)
      transaction.withdrawal
      expect(transaction.debit).to eq -500
      expect(transaction.credit).to eq false
      expect(transaction.balance).to eq 500
    end
  end
end
