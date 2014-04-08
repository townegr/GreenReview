GreenReview::Application.routes.draw do
  root 'users#index'
  resources :products
  resources :reviews
  devise_for :users
end
