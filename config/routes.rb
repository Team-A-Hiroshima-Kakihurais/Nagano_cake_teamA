Rails.application.routes.draw do
  
  scope module: :public do
    get 'deliveries/index'
    get 'deliveries/edit'
    get 'customers/show'
    get 'customers/edit'
    root to: "homes#top"
    get 'about' => 'homes#about', as: 'about'
    resources :items, only: [:index, :show]
  end 

  
  devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
