Rails.application.routes.draw do
  namespace :admin do
    get 'genres/index'
    get 'genres/edit'
  end
  namespace :public do
    get 'deliveries/index'
    get 'deliveries/edit'
  end
  namespace :public do
    get 'customers/show'
    get 'customers/edit'
  end
  namespace :public do
    root to: "homes#top"
    get 'about' => 'homes#about', as: 'about'
  end 

  
  devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}
 
  scope module: :public do
    get 'deliveries/new'
    post 'deliveries' => 'deliveries#create' 
    get 'deliveries/index'
    get 'deliveries/edit'
    
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

devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}

namespace :admin do
  resources :items, only: [:index, :new, :create, :show, :edit, :update]
  resources :genres, only: [:index, :edit, :create, :update]
end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
