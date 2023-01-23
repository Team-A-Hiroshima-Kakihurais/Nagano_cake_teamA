class Public::CartItemsController < ApplicationController
  # 制作途中
  before_action :set_cart_item, only: [:update, :destroy]

  def index
     @carts = current_customer.cart_items.all
     @total = @carts.inject(0) {|sum, cart| sum + cart.add_total_payment_all}
  end

  def create
    increase_or_create(params[:cart_item][:item_id],params[:cart_item][:amount])
    redirect_to cart_items_path, notice:' 商品を追加しました'
  end

  def update
    @cart_item.update(cart_params)
    redirect_to request.referer, notice:' カートを変更しました'
  end

  def destroy
    @cart_item.destroy
    redirect_to request.referer
  end

  def destroy_all
    current_customer.cart_items.destroy_all
    redirect_to cart_items_path
  end

  private
    def set_cart_item
      @cart_item = current_customer.cart_items.find(params[:id])
    end

    def cart_params
      params.require(:cart_item).permit(:item_id, :amount)
    end

    def increase_or_create(item_id, amount)
      cart_item = current_customer.cart_items.find_by(item_id: item_id)
      if cart_item
        cart_item.update(amount: cart_item.amount + amount.to_i)
      else
         current_customer.cart_items.new(cart_params).save
      end
    end

end
