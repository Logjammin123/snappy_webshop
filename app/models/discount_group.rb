class DiscountGroup < ActiveRecord::Base
  attr_accessible :discount, :name

  has_many :users

  def to_s
  	self.name.to_s
  end
end
