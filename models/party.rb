

class Party < ActiveRecord::Base
  has_many :foods, :through => :orders
  has_many :orders
  belongs_to :users


  def total
    result = 0
    self.foods.each do |food|
      result += food.cents
    end
    return result
  end
end
