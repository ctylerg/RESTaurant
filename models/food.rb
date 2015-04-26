class Food <ActiveRecord::Base
  has_many(:orders)
  has_many(:parties)
  def to_s
  end
end
