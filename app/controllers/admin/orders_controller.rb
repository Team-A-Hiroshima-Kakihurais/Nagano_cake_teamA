class Admin::OrdersController < ApplicationController
  before_action :authenticate_admin!
  
  def show
    @order = Order.find(params[:id])
    @order_item = @order.order_items
    @total = 0
  end
  
  def update
    @order = Order.find(params[:id])
    @order.update(order_params)
    redirect_back(fallback_location: admin_order_path)
  end
  
  private

  def order_params
    params.require(:order).permit(:status, :order_item)
  end
  
end
