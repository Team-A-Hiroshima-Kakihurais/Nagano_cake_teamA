class ApplicationController < ActionController::Base
  before_action :devise_permitted_parameters, if: :devise_controller?
  
  def devise_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name, :first_name, :last_name_kana,:first_name_kana,
    :post_code, :address, :phone_number ])
  end
end
