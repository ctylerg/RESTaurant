class Order <ActiveRecord::Base
  belongs_to(:foods)
  belongs_to(:parties)
  def to_s
  end
end
