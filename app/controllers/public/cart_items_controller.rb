class Public::CartItemsController < ApplicationController
  # 制作途中
  def index
  end
  
  def create
    cart = current_customer.CartItem.new(cart_params)
    if cart.save
      redirect_to cart_items_path, notice:'商品を追加しました'
    else
      render 'items/show'
    end
  end
  
  def update
  end
  
  def destroy
  end
  
  def destroy_all
  end
  
  private
    def cart_params
      params.require(:cart_item).parmit(:id, :amount)
    end
end
