Rails.application.routes.draw do

  devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

  scope module: :public do
    get 'deliveries/index'
    get 'deliveries/edit'
    get 'customers/show'
    get 'customers/edit'
    root to: "homes#top"
    get 'about' => 'homes#about', as: 'about'
    resources :items, only: [:index, :show]
    delete 'cart_items/destroy_all', to: 'cart_items#destroy_all', as: 'destroy_all'
    resources :cart_items, only: [:index, :create, :update, :destroy]
    resources :orders, only: [:index, :show, :create, :new]
    post 'orders/comfirm', to: 'orders#confirm', as: 'confirm'
    get 'orders/complete', to: 'orders#complete', as: 'complete'
  end


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
