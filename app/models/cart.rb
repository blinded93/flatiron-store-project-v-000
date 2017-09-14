class Cart < ActiveRecord::Base
  has_many :line_items
  has_many :items, through: :line_items

  belongs_to :order
  belongs_to :user

  def total
    total = 0.00
    line_items.each do |line_item|
      total += (line_item.item.price * line_item.quantity)
      line_item.save
    end
    total
  end

  def add_item(item_id)
    if line_item = line_items.find_by(item_id:item_id)
      line_item.tap{|li| li.quantity += 1}.save
      line_item
    else
      item = line_items.build(item_id: item_id)
    end
  end

  def checkout_cart
    self.update(status: "submitted")
    line_items.each do |li|
      item = li.item
      item.update(inventory: item.inventory - li.quantity)
    end
  end
end
