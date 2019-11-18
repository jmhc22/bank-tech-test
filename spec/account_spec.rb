require 'account'

describe Account do
  subject(:account) { described_class.new }

  describe '#deposit' do
    it 'depositing 2000 increases the users balance by 2000' do
      original_balance = account.current_balance
      account.deposit(amount: 2000)
      expect(account.current_balance).to eq (original_balance + 2000)
    end

    it 'depositing 1000 then 500 increases the users balance by 1500' do
      original_balance = account.current_balance
      account.deposit(amount: 1000)
      account.deposit(amount: 500)
      expect(account.current_balance).to eq (original_balance + 1500)
    end
  end

  describe '#withdraw' do
    it 'withdrawing 100 decreases the users balance by 100' do
      account.deposit(amount: 500)
      original_balance = account.current_balance
      account.withdraw(amount: 100)
      expect(account.current_balance).to eq (original_balance - 100)
    end

    it 'withdrawing more than the available account balance will throw an error' do
      expect{ account.withdraw(amount: 100) }.to raise_error('Insufficient funds')
    end
  end

end
