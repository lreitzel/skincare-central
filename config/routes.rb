Rails.application.routes.draw do

  root "sessions#homepage"

  get '/auth/:google_oauth2/callback', to: "sessions#omniauth"
  # get 'auth/failure', to: redirect('/')
  get '/product_category', to: "products#product_category"

  resources :products, only: [:index, :show, :new, :create, :edit, :update]
  resources :reviews
  resources :users

  resources :products, only: [:show] do
    resources :reviews, only: [:index, :show, :new]
  end
  
  get '/login', to: "sessions#new"
  post '/login', to: "sessions#create"
  post '/logout', to: "sessions#destroy"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get '/*path', to: "sessions#homepage"
end
