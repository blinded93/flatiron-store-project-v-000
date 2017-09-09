class Cart < ActiveRecord::Base
  has_many :line_items
  has_many :items, through: :line_items

  has_one :order
  has_one :user, through: :order

  def total
    total = 0.00
    line_items.each do |line_item|
      total += (line_item.item.price * line_item.quantity)
    end
    total
  end

  def add_item(item)
    if line_item = self.line_items.find_by(item_id:item)
      line_item.tap {|li| li.quantity += 1}
    else
      LineItem.new(cart_id: self.id, item_id: item)
    end
  end
end
