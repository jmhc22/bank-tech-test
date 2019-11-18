# Makers Week 10 - Bank Tech Test #
## Summary ##

A simple banking interface written in Ruby that users can interact with via IRB.


## Setup ##

First, clone this repository. Then:

```bash
> bundle install

> bundle exec rspec #to run unit tests
> irb -r './lib/account' #to interact with program
```
#### Gemfile ####
```ruby
ruby '2.6.3'

group :test do
	gem 'rspec'
	gem 'simplecov', require: false
	gem 'simplecov-console', require: false
	gem 'rubocop', require: false
end
```


## Requirements ##
* A user can deposit into their bank account
* A user can make a withdrawal from their account
* A user can print a bank statement (date, amount, balance)

Note: Data stored to memory, there are no databases

| Classes    | Methods |
| -------- | ------- |
| Account  | deposit, withdraw, current_balance, print_statement |
| Transaction | date, incurred_balance, credit, debit |
| Statement | generate_statement |


#### Edge Cases ####

* Withdrawal edge case - cannot withdraw more than the balance available. Raises error if attempted.

### Challenges / Future Development ###
I could have made separate withdrawal and deposit classes, however the instance variables and methods for each would be very similar. To keep the code DRY while the requirements are still basic - I have created one transaction class. If the classes were to diverge further and different methods/variables would be required in each, I would name appropriate methods the same to ensure polymorphism across the two new classes so other methods can process either class without needing to distinguish between the two.

## Tests ##

### Technologies ###

RSpec - unit tests written for each feature, and dependency injection used to ensure isolation of classes when testing. 12 tests in total.

SimpleCov - used to ensure high test coverage. Current test coverage is 100 %.

RuboCop - used to ensure high quality syntax that follows Ruby convention where possible. Currently 26 offences detected.

#### Acceptance Criteria ####
* Given a client makes a deposit of 1000 on 10-01-2012
* And a deposit of 2000 on 13-01-2012
* And a withdrawal of 500 on 14-01-2012
* When she prints her bank statement
* Then she would see:
```
date || credit || debit || balance
14/01/2012 || || 500.00 || 2500.00
13/01/2012 || 2000.00 || || 3000.00
10/01/2012 || 1000.00 || || 1000.00
```

Launch irb in the command line : `irb -r './lib/account'`
```ruby
account = Account.new
account.deposit(amount: 1000, date: Date.parse('2012-01-10'))
account.deposit(amount: 2000, date: Date.parse('2012-01-13'))
account.withdraw(amount: 500, date: Date.parse('2012-01-14'))
account.print_statement

# =>
#date || credit || debit || balance
#14/01/2012 || || 500.00 || 2500.00
#13/01/2012 || 2000.00 || || 3000.00
#10/01/2012 || 1000.00 || || 1000.00
```

## Code ##

* DRY/SRP - all methods are shorter than three lines and have been refactored into private methods where repetitive or possible.
