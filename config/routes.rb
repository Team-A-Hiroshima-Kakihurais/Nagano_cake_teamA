Rails.application.routes.draw do
  
  devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}
 
  scope module: :public do
    resources :deliveries, only: [:new, :create, :index, :edit, :update, :destroy]
    
    #resource :customers, only: [:show, :edit]
    get 'customers/my_page'  => 'customers#show'
    get 'customers/information/edit' => 'customers#edit', as: 'edit_customer'
    patch 'customers/information' => 'customers#update', as: 'update_customer'
    
    root to: "homes#top"
    get 'about' => 'homes#about', as: 'about'
    resources :items, only: [:index, :show]
    resources :cart_items, only: [:index, :create, :update, :destroy]
    delete 'cart_items/delete_all', to: 'cart_items#destory_all', as: 'destory_all'
  end 

  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
