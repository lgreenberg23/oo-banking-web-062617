# require 'pry'

class Transfer
  attr_accessor :status, :sender, :receiver, :amount, :last_transfer_amount


  def initialize(sender, receiver, amount)
  	@sender = sender
  	@receiver = receiver

  	@status = "pending"
  	@amount = amount
  	@last_transfer_amount = 0
  end


  def valid?
  	if self.sender.valid? && self.receiver.valid?
  		true
  	else
  		false
  	end
  end

  def execute_transaction
  	if self.sender.valid?
  		if self.sender.balance > self.amount
		  	self.sender.withdraw(self.amount)
	  		self.receiver.deposit(self.amount)
	  		self.last_transfer_amount = self.amount
	  		self.amount = 0
	  		self.status = "complete"
	  	else
	  		self.status = "rejected"
	  		"Transaction rejected. Please check your account balance."
	  	end
  	else 
  		self.status = "rejected"
  		"Transaction rejected. Please check your account balance."
  	end
  end

  def reverse_transfer
  	self.sender.deposit(self.last_transfer_amount)
  	self.receiver.withdraw(self.last_transfer_amount)
  	self.status = "reversed"
  end


end
