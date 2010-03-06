# Copyright 2010 Software Inventions, Inc
# 1. Procs -- storing a block
# 2. Proc context rules
# 3. Dynamic, branching, RTS

class Account
   def initialize(name, bal)
      @name = name    # Account name
      @balance = bal  # Initial balance
   end

   attr_accessor :balance, :name

   def getCharge(amt)
      return proc {
         @balance -= amt
         puts "Charging #{amt} to #{@name} leaving #{@balance}"
      }
   end
end

acct1 = Account.new("Account1", 1000)
acct2 = Account.new("Account2", 2000)

chg1a = acct1.getCharge(20)
chg1b = acct1.getCharge(100)

chg2a = acct2.getCharge(25)
chg2b = acct2.getCharge(105)

puts "Now let's do some charges"
chg1a.call
chg1b.call
chg2a.call
chg2b.call

chg1a.call
chg2b.call
