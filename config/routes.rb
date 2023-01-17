Rails.application.routes.draw do
  
  devise_for :customers,skip:[:password],controllers:{
    registrations: "public/registrations",
    sessions: "public/sessions"
  }
  devise_for :admins,skip:[:registrations, :password], controllers:{
    sessions: "admin/sessions"
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
