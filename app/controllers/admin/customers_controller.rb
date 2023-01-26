class Admin::CustomersController < ApplicationController
    before_action :authenticate_admin!
    
    def index
     @customers = Customer.all
    end
    
    def show
     @customer = Customer.find(params[:id])
    end
    
    def edit
     @customer = Customer.find(params[:id])
    end
    
    def update
     @customer = Customer.find(params[:id])
     if @customer.update(customer_params)
      flash[:notice] = "変更を保存しました。"
      redirect_to admin_customer_path(@customer.id)
     else
      render :edit
     end 
    end
    
    private
    def customer_params
      params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :post_code, :address, :phone_number, :is_deleted)
    end
end
