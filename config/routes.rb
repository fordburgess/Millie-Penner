Rails.application.routes.draw do
  devise_for :users
  resources :zines, only: [:index, :show]  
  resources :carts, only: [:show]

  root to: 'pages#home'

  post '/add_to_cart/:product_id' => 'carts#add_to_cart', :as => 'add_to_cart'

  namespace :admin do 
    root to: 'admin#dashboard'
    get '/zines/all', to: 'admin#zines_all'
    resources :zines, except: [:show, :index]
  end
  
end
