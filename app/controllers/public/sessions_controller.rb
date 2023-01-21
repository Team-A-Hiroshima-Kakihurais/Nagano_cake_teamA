# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
before_action :reject_customer, only: [:create]
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
  
  private
  
  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :post_code, :address, :phone_number, :is_deleted)
  end
  
  protected
  
  def reject_customer
    @customer = Customer.find_by(email: params[:customer][:email])
    #return if !@customer 
    if @customer.valid_password?(params[:customer][:password]) && (@customer.is_deleted == true)
       flash[:notice] = "退会済みです。再度ご登録をしてご利用ください。"
       redirect_to new_customer_registration_path
     else

     end
  end
end
  

