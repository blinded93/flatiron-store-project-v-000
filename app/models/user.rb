class User < ActiveRecord::Base
  attr_accessor :current_cart

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  has_many :orders
  has_many :carts, through: :orders
end
