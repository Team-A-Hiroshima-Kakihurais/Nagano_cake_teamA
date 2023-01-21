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
    get 'customers/unsubscribe' => 'customers#unsubscribe', as: 'unsubscribe'
    patch 'customers/withdrawal' => 'customers#withdrawal', as: 'withdrawal'
    
    root to: "homes#top"
    get 'about' => 'homes#about', as: 'about'
    resources :items, only: [:index, :show]
    delete 'cart_items/destroy_all', to: 'cart_items#destroy_all', as: 'destroy_all'
    resources :cart_items, only: [:index, :create, :update, :destroy]
    get 'orders/complete', to: 'orders#complete', as: 'complete'
    post 'orders/comfirm', to: 'orders#confirm', as: 'confirm'
    resources :orders, only: [:index, :show, :create, :new]
  end


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
