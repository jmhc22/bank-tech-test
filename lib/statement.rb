# frozen_string_literal: true

class Statement
  def initialize
    @statement_header = "date || credit || debit || balance\n"
  end

  def generate_statement(transactions)
    @statement_header + transactions.reverse.map do |t|
      "#{t.date.strftime('%d/%m/%Y')} || #{format(t.credit)} || #{format(t.debit)} || #{format(t.balance)}"
    end.join("\n")
  end

  private

  def format(num)
    num.is_a?(Integer) ? '%.2f' % num.abs : ''
  end
end
