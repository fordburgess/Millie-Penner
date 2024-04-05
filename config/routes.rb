Rails.application.routes.draw do
  resources :zines, except: [:edit]

  root to: 'pages#home'

  namespace :admin do 
    root to: 'pages#dashboard'
    resources :zines

  end
  
end
