Rails.application.routes.draw do

  root 'sessions#homepage'

  resources :products
  resources :reviews
  resources :users

  resources :products, only: [:index, :show] do
    resources :reviews, only: [:index, :show, :new]
  end
  
  

  get '/login', to: "sessions#new"
  post '/login', to: "sessions#create"
  post '/logout', to: "sessions#destroy"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
