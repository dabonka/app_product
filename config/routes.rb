Rails.application.routes.draw do
  resources :products
  resources :categories

  root :to => "products#index"

  get '/' => "products#index"
  post '/' => "products#index"
end
