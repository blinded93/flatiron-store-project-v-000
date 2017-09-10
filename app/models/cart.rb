class Cart < ActiveRecord::Base
  has_many :line_items
  has_many :items, through: :line_items

  belongs_to :order
  belongs_to :user

  def total
    total = 0.00
    line_items.each do |line_item|
      total += (line_item.item.price * line_item.quantity)
    end
    total
  end

  def add_item(item_id)
    binding.pry
    if line_item = self.line_items.find_by(item_id:item_id)
      line_item.tap {|li| li.quantity += 1}
    else
      LineItem.new(cart_id: self.id, item_id: item_id)
    end
  end

  def empty?
    self.items.empty?
  end

  def self.set_cart(user)
    user.carts.where(user_id: user.id).first_or_create(order_id: Order.create.id)
  end
end
