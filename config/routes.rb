Rails.application.routes.draw do
  devise_for :users
  # resources :zines, except: [:edit, :new]

  get '/zines', to: 'zines#index'
  get '/zines/:id', to: 'zines#show'

  root to: 'pages#home'

  namespace :admin do 
    root to: 'admin#dashboard'
    get '/zines/all', to: 'admin#zines_all'
    resources :zines, except: [:show, :index]
  end
  
end
