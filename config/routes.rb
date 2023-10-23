Rails.application.routes.draw do
  get 'users/create'
  get 'pings/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get "ping", to: "pings#index"
  post "signup", to: "users#create"
  
  resources :users, only: [:index, :show]
end
