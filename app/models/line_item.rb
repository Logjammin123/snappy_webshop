class LineItem < ActiveRecord::Base
  attr_accessible :cart_id, :price, :product_id, :quantity

  belongs_to :cart, :touch => true
  belongs_to :product, :touch => true
  delegate :user, :to => :cart, :allow_nil => true

  validates :product_id,
      :uniqueness => { :scope => :cart_id }  

  after_save :destroy_if_quantity_is_zero

  def total
    self.quantity * self.product.discounted_price(self.user)
  end

  private
  def destroy_if_quantity_is_zero
    if self.quantity == 0
      self.destroy
    end
  end

end
