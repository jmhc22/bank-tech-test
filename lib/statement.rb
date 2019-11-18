class Statement

  def initialize
    @statement_header = "date || credit || debit || balance\n"
  end

  def generate_statement(transactions)
    return @statement_header +
    transactions.reverse.map { |t|
      "#{t.date.strftime('%e/%-m/%Y')} || #{format(t.credit)} || #{format(t.debit)} || #{format(t.balance)}"
    }.join("\n")
  end

  private

  def format(num)
    return '%.2f' % num.abs if num.is_a? Integer
    ''
  end

end
