class Admin::OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
    @item = Item.all
  end
  
  def update
    @order = Order.find(params[:id])
    @order.update(order_params)
    redirect_back(fallback_location: admin_order_path)
  end
  
  private

  def order_params
    params.require(:order).permit(:status)
  end
  
end
