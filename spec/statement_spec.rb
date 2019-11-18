require 'statement'
require 'date'

describe Statement do

  subject(:statement) { described_class.new }

  let(:transaction_double1) { double :transaction_double1,
    date: Date.parse('2019-11-17'), credit: 1000, balance: 1000, debit: false }
  let(:transaction_double2) { double :transaction_double2,
    date: Date.parse('2019-11-18'), credit: false, balance: 750, debit: -250 }

  describe '#generate_statement' do
    it 'passing in the transaction log will print a statement' do
      expected_statement = "date || credit || debit || balance\n18/11/2019 ||  || 250.00 || 750.00\n17/11/2019 || 1000.00 ||  || 1000.00"
      transactions = [transaction_double1, transaction_double2]
      expect(statement.generate_statement(transactions)).to eq expected_statement
    end
  end
end
