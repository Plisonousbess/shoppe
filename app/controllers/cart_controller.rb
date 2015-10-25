class CartController < ApplicationController

  def index
    @cart = Cart.find_by(user_id: current_user.id)
    @product = Product.where(id: params[:format])
    render :cart
  end

  def show
    render :cart
  end

end
