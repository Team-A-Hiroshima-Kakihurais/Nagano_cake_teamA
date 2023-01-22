class Public::DeliveriesController < ApplicationController
  
  
  def index
    @customer = Customer.find(current_customer.id)
    @deliveries = @customer.deliveries
  end
  
  def new
    @delivery = Delivery.new
  end 
  
  def create
    @delivery = Delivery.new(delivery_params)
    @delivery.customer_id = current_customer.id
    @delivery.save
    redirect_to deliveries_index_path
  end

  def edit
  end
  
  private
  def delivery_params
    params.require(:delivery).permit(:post_code, :address, :name)
  end
end
