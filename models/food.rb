

class Food < ActiveRecord::Base
  has_many :parties, :through => :orders
  has_many :orders
end
