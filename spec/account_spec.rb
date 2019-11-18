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

end
