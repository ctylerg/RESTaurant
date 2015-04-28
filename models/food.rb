

class Food < ActiveRecord::Base
  has_many :parties, :through => :orders
  has_many :orders

  def price
	  self.cents / 100
	end

	def price=(new_price)
	  self.cents = new_price * 100
	end

end
