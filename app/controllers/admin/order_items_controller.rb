class Admin::OrderItemsController < ApplicationController
    before_action :authenticate_admin!
    
    def update
        @order_item = OrderItem.find_by(id: params[:id])
        @order_item.update(orderitem_params)
        redirect_back(fallback_location: admin_order_path)
    end
    
  private

  def orderitem_params
    params.require(:order_item).permit(:order_item, :order, :making_status)
  end
    
end
