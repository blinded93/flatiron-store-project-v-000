class LineItemsController < ApplicationController
  def create
    session[:cart_id] = Cart.set_cart(current_user).id
    cart_item = current_cart.add_item(params[:item_id])
    cart_item.cart = current_cart
    if cart_item.save
      redirect_to cart_path(current_cart), notice: "#{cart_item.item.title} has been added to your cart!"
    else
      redirect_to store_path, notice: "There seems to have been a problem."
    end
  end
end
