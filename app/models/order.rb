class Order < ActiveRecord::Base
  has_one :cart
  has_one :user, through: :cart
end
