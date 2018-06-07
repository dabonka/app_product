Rails.application.routes.draw do
  resources :products
  resources :categories

  get '/' => "products#index"
end
