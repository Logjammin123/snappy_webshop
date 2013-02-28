class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  # :recoverable, :trackable, :rememberable
  devise :database_authenticatable, :registerable,
         :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :first_name, :last_name, :discount_group_id
  # attr_accessible :title, :body

  has_many :carts
  has_many :ratings

  belongs_to :discount_group
  delegate :discount, :to => :discount_group, :allow_nil => true

  def to_s
    "#{self.first_name} #{self.last_name}".strip
  end

end
