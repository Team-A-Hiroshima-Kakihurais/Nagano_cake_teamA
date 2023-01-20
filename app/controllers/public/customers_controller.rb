class Public::CustomersController < ApplicationController
  def show
    @customer = Customer.find(current_customer.id)
  end 

  def edit
    @customer = Customer.find(current_customer.id)
  end
  
  def update
    @customer = Customer.find(current_customer.id)
    if @customer.update(customer_params)
     flash[:notice] = "You have updated user successfully."
     redirect_to customers_my_page_path(current_customer.id)
    else
     render :edit
    end 
  end
  
  private
  
  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :post_code, :address, :phone_number)
  end
end
