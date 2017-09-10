class CartsController < ApplicationController
  def show
    @cart = current_cart
  end

  def checkout


    current_cart.clear
    redirect_to cart_path(current_cart)
  end
end
