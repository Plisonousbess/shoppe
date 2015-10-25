class PendingPurchasesController < ApplicationController

  def create
    # p current_user
    # p params

    @product = Product.where(id: params[:format])
    if Cart.where(user_id: current_user.id) == []
    #   # check if no cart associated with user, if none create one
      @cart = Cart.create(user_id: current_user.id)
      # p @cart
      # p "CART ^"
    else
      # p @product
      # p "PRODUCT ^"
      @cart = Cart.find_by(user_id: current_user.id)
    end
    @pending_purchase = PendingPurchase.create(cart_id: @cart.id, product_id: params[:format])

    # p @cart
    # p "CART ^"
    # p params
    # p "PARAMETERS ^"
    redirect_to cart_index_path
    #   p "*" * 80
    #   p @cart
    #   p "*" * 80
    #   p "Params: "
    #   p params
    #   # create purchase with user and cart id
     # PendingPurchase.create(user_id: user_session.id, cart_id: @cart.where(user_id: user_session.id))
    # else
    #   # create purchase with user and cart id
    #   PendingPurchase.create(user_id: user_session.id, cart_id: @cart.where(user_id: user_session.id))
    # end
  end

  def show
    @cart = Cart.find_by(user_id: current_user.id)
    @product = Product.where(id: params[:format])
    redirect_to cart_index_path
  end

  def destroy
    @pending_purchase = PendingPurchase.find(params[:id])
    p @pending_purchase
    p "*" * 100
    @pending_purchase.destroy!
    redirect_to cart_index_path
  end

end
