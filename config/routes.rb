Rails.application.routes.draw do
  resources :zines  

  root to: 'pages#home'

  get "/dashboard", to: 'pages#dashboard'
  
end
