class Statement

  def initialize
    @statement_headers = "date || credit || debit || balance\n"
  end

  def print_statement(transactions)
    return @statement_headers +
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
