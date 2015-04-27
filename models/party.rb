

class Party < ActiveRecord::Base
  has_many :foods, :through => :orders
  has_many :orders
end
