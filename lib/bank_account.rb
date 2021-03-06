class BankAccount
	attr_reader :name, :amount
	attr_accessor :balance, :status

	def initialize(name)
		@name = name
		@balance = 1000
		@status = "open"
	end

	def deposit(amount)
		@balance += amount
	end

	def withdraw(amount)
		@balance -= amount
	end

	def display_balance
		"Your balance is $#{self.balance}."
	end

	def valid?
		if (self.status == "open" && self.balance > 0)
			true
		elsif(self.status != "open" || self.balance <=0)
			false
		else
			false
		end
	end

	def close_account
		self.status = "closed"
	end



end
