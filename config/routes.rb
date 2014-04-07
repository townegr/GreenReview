GreenReview::Application.routes.draw do
  root 'users#index'
  resources :products
  devise_for :users
end
