class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
    @deliveries = Delivery.all.map do |delivery|
      "〒#{delivery.post_code} #{delivery.address} #{delivery.name}"
    end
  end

  def confirm
    @carts = current_customer.cart_items
    @order = Order.new(order_params)
    
  end

  def complete
  end

  def index
  end

  def show
  end
  
  private
    def select_full_address(option)
      case option
        when '1'
          @order.address = current_customer.add_delivery_address + current_customer.add_full_name
        when '2'
          @order.address = params[:address]
      end
    end
end
