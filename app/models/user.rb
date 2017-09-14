class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :rememberable, :trackable, :validatable

  has_many :orders, through: :carts
  has_many :carts
  has_one :current_cart, class_name: 'Cart', foreign_key: 'user_id'
end
