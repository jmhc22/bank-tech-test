require 'account'

describe Account do

  let(:transaction_double) { double :transaction_double }
  let(:transaction_class_double) { double :transaction_class_double, new: transaction_double }
  subject(:account) { described_class.new(transaction_class: transaction_class_double) }

  describe '#deposit' do
    it 'depositing 2000 increases the users balance by 2000' do
      original_balance = account.current_balance
      allow(transaction_double).to receive(:deposit).and_return(2000)
      account.deposit(amount: 2000)
      expect(account.current_balance).to eq (original_balance + 2000)
    end

    it 'depositing 1000 then 500 increases the users balance by 1500' do
      original_balance = account.current_balance
      allow(transaction_double).to receive(:deposit).and_return(1000)
      account.deposit(amount: 1000)
      allow(transaction_double).to receive(:deposit).and_return(500)
      account.deposit(amount: 500)
      expect(account.current_balance).to eq (original_balance + 1500)
    end
  end

  describe '#withdraw' do
    it 'withdrawing 100 decreases the users balance by 100' do
      allow(transaction_double).to receive(:deposit).and_return(500)
      account.deposit(amount: 500)
      original_balance = account.current_balance
      allow(transaction_double).to receive(:withdrawal).and_return(-100)
      account.withdraw(amount: 100)
      expect(account.current_balance).to eq (original_balance - 100)
    end

    it 'withdrawing more than the available account balance will throw an error' do
      expect{ account.withdraw(amount: 100) }.to raise_error('Insufficient funds')
    end
  end

end
