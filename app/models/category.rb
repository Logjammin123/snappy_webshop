class Category < ActiveRecord::Base
  attr_accessible :name

  has_many :products

  def to_s
  	self.name.to_s
  end
end
