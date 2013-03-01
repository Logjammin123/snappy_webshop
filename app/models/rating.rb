class Rating < ActiveRecord::Base
  attr_accessible :product_id, :user_id, :value

  belongs_to :product, :touch => true
  belongs_to :user, :touch => true

  validates :product,
            :presence => true

  validates :user,
            :presence => true

  validates :product_id,
  			:uniqueness => { :scope => :user_id }  
end
