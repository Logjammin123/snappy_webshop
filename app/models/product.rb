class Product < ActiveRecord::Base
  attr_accessible :category_id, :description, :name, :price

  belongs_to :category
  has_many :ratings
  has_many :line_items

  def to_s
  	self.name.to_s
  end

  def average_rating
    self.ratings.average(:value).to_i.ceil
  end

  def discounted_price(user = nil)
    if user && user.class == User
      discount = self.price * (user.discount.to_f / 100)
      self.price - discount
    else
      self.price
    end
  end
end
