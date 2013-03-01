class Cart < ActiveRecord::Base
  attr_accessible :state, :user_id

  belongs_to :user, :touch => true
  has_many :line_items

  def total
    sum = 0
    self.line_items.each do |line_item|
      sum += line_item.total
    end
    sum
  end

end
