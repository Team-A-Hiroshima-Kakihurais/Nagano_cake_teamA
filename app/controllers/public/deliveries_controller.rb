class Public::DeliveriesController < ApplicationController
  
  def index
    @delivery = Delivery.new
    @customer = Customer.find(current_customer.id)
    @deliveries = @customer.deliveries
  end
  
  def new
    @delivery = Delivery.new
  end
  
  def create
    @delivery = Delivery.new(delivery_params)
    @delivery.customer_id = current_customer.id
    if @delivery.save
      flash[:notice] = "登録に成功しました。"
      redirect_to deliveries_path
    else
      @customer = Customer.find(current_customer.id)
      @deliveries = @customer.deliveries
      render :index
   end 
  end

  def edit
    @delivery = Delivery.find(params[:id])
  end
  
  def update
    @delivery = Delivery.find(params[:id])
    if @delivery.update(delivery_params)
      flash[:notice] = "変更を保存しました。"
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
