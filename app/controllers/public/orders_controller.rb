class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
    @deliveries = Delivery.all.map do |delivery|
      [
        delivery.id,
        "〒#{delivery.post_code} #{delivery.address} #{delivery.name}"
      ]
    end
  end

  def confirm
    @carts = current_customer.cart_items
    @order = Order.new(order_params)
    select_destination(params[:order][:address_option])
  end

  def complete
  end

  def index
  end

  def show
  end

  private
    def order_params
      params.require(:order).permit(
        :payment_method,
        :option,
        :address_id,
        :other_post_code,
        :other_address,
        :other_name)
    end
    def select_destination(option)
      case option
        when '0'
          @order.post_code = current_customer.post_code
          @order.address = current_customer.address
          @order.name = current_customer.name
        when '1'
          del = current_customer.deliveries.find(params[:address_id])
          @order.post_code = del.post_code
          @order.address = del.address
          @order.name = del.name
        when '2'
          @order.post_code = params[:order][:other_post_code]
          @order.address = params[:order][:other_address]
          @order.name = params[:order][:other_name]
      end
    end
end
