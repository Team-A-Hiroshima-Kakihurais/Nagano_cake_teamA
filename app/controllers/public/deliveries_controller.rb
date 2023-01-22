class Public::DeliveriesController < ApplicationController
  
  def index
    @delivery = Delivery.new
  end
  
  def create
    @delivery = Delivery.new(delivery_params)
    @delivery.customer_id = current_customer.id
    @delivery.save
    redirect_to deliveries_path
  end

  def edit
    @delivery = Delivery.find(params[:id])
  end
  
  def update
    @delivery = Delivery.find(params[:id])
    if @delivery.update(delivery_params)
      flash[:notice] = "You have updated book successfully."
      redirect_to deliveries_path
    else
      render :edit
    end 
  end
  
  def destroy
    @delivery = Delivery.find(params[:id])
    @delivery.destroy
    redirect_to deliveries_path
  end 
  
  private
  
  def delivery_params
    params.require(:delivery).permit(:post_code, :address, :name)
  end
  
end
