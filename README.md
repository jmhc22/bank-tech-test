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
