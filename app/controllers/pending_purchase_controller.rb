class PendingPurchaseController < ApplicationController

  def create
    if Cart.where(user_id: user_session.id) == nil
      # check if no cart associated with user, if none create one
      Cart.create(user_id: user_session.id)
      p "*" * 80
      p @cart
      p "*" * 80
      p "Params: "
      p params
      # create purchase with user and cart id
      PendingPurchase.create(user_id: user_session.id, cart_id: @cart.where(user_id: user_session.id))
    else
      # create purchase with user and cart id
      PendingPurchase.create(user_id: user_session.id, cart_id: @cart.where(user_id: user_session.id))
    end
  end

  def show
    redirect_to cart_path
  end
end
