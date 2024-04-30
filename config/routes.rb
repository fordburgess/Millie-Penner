Rails.application.routes.draw do
  devise_for :users
  resources :zines, only: [:index, :show]  
  resources :carts, only: [:show]
  resources :articles, only: [:index, :show]
  resources :orders
  resources :payment_intents

  root to: 'pages#home'

  # one off pages
  get '/pages/makeup-art' => 'pages#makeup_art'
  

  # for ajax requests
  get '/zines/ajax/:id' => 'zines#zines_ajax'

  # cart functionality
  post '/add_to_cart/:product_id' => 'carts#add_to_cart', :as => 'add_to_cart'
  delete '/remove_from_cart/:product_id' => 'carts#remove_from_cart', :as => 'remove_from_cart'
  delete '/empty_cart' => 'carts#empty_cart', :as => 'empty_cart'

  # order functionality

  # mailer functionality
  get '/confirmation_email' => 'orders_mailer#confirmation_email', :as => 'confirmation_email'

  namespace :admin do 
    root to: 'admin#dashboard'
    get '/zines/all', to: 'admin#zines_all'
    resources :zines, except: [:show, :index]
    resources :orders, only: [:show, :index]
    resources :articles, except: [:show]
  end
  
end
