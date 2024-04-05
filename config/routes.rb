Rails.application.routes.draw do
  devise_for :users
  resources :zines, except: [:edit]

  root to: 'pages#home'

  namespace :admin do 
    root to: 'admin#dashboard'
    resources :zines
  end
  
end
