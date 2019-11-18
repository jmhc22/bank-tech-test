## Makers Week 10 - Bank Tech Test ##
### Summary ###

A simple banking interface written in Ruby that users can interact with via IRB.


### Setup ###

First, clone this repository. Then:

'''bash
bundle install
irb -r 'tbc'
'''

#### Gemfile ####


### Requirements ###

* A user can deposit into their bank account
* A user can make a withdrawal from their account
* A user can print a bank statement (date, amount, balance)

Note: Data stored to memory, there are no databases

| Class    | Methods |
| -------- | ------- |
| Account  | deposit, withdraw, current_balance |
| Transaction | date, amount, new_balance |
| Statement | print |

Could have made separate withdrawal and deposit classes, however the instance
variables and methods would be very similar - so to DRY up the code the transaction
class will have a type variable to distinguish between the two. Or I will use
polymorphism?

Withdrawal edge case - cannot withdraw more than the balance available.

#### Acceptance Criteria ####

Given a client makes a deposit of 1000 on 10-01-2012
And a deposit of 2000 on 13-01-2012
And a withdrawal of 500 on 14-01-2012
When she prints her bank statement
Then she would see
'''
date || credit || debit || balance
14/01/2012 || || 500.00 || 2500.00
13/01/2012 || 2000.00 || || 3000.00
10/01/2012 || 1000.00 || || 1000.00
'''

launch irb
'''ruby
account = Account.new
account.deposit(amount: 1000, date: Date.parse('2012-01-10'))
account.deposit(amount: 2000, date: Date.parse('2012-01-13'))
account.withdraw(amount: 500, date: Date.parse('2012-01-14'))
account.print_statement
'''
