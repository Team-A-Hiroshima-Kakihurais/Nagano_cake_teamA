class Admin::OrderItemsController < ApplicationController
    before_action :authenticate_admin!
    
    def update
        @order_item = OrderItem.find_by(id: params[:id])
        @order = @order_item.order
        @order_items = @order.order_items.all
        
        is_updated = true
    if  @order_item.update(orderitem_params)
        @order.update(status: 2) if @order_item.making_status == "in_production" 
        @order_items.each do |order_item| #　紐付いている注文商品の製作ステータスを一つ一つeach文で確認していきます。
     if order_item.making_status != "completed" # 製作ステータスが「製作完了」ではない場合 
        is_updated = false # 上記で定義してあるis_updatedを「false」に変更する。
     end
    end
    @order.update(status: 3) if is_updated
    end
        redirect_back(fallback_location: admin_order_path)
    end
    
  private

  def orderitem_params
    params.require(:order_item).permit(:order_item, :order, :making_status)
  end
    
end
