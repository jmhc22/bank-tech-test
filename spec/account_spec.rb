require 'account'

describe Account do

  let(:transaction_double) { double :transaction_double }
  let(:transaction_class_double) { double :transaction_class_double, new: transaction_double }
  expected_statement = "date || credit || debit || balance\n18/11/2019 ||  || 250.00 || 750.00\n17/11/2019 || 1000.00 ||  || 1000.00"
  let(:statement_double) { double :statement_double, generate_statement: expected_statement }
  subject(:account) { described_class.new(transaction_class: transaction_class_double, statement: statement_double) }

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

  describe '#transaction_log' do
    it 'transactions are saved to the transaction log' do
      allow(transaction_double).to receive(:deposit).and_return(500)
      account.deposit(amount: 500)
      expect(account.transaction_log).to include transaction_double
    end

    it 'if two transactions completed, the log will contain two objects' do
      allow(transaction_double).to receive(:deposit).and_return(500)
      account.deposit(amount: 500)
      expect(account.transaction_log.size).to eq 1
      allow(transaction_double).to receive(:withdrawal).and_return(500)
      account.withdraw(amount: 200)
      expect(account.transaction_log.size).to eq 2
    end
  end

  describe '#print_statement' do
    it 'prints account statement to stdout' do
      expect { account.print_statement }.to output(expected_statement).to_stdout
    end
  end
end
