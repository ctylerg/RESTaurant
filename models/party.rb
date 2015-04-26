class Party <ActiveRecord::Base
  has_many(:orders)
  has_many(:foods)
  def to_s
  end
end
