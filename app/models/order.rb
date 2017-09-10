class Order < ActiveRecord::Base
  has_one :cart
  has_many :users
end
