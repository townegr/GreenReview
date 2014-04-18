GreenReview::Application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  root 'users#index'

  resources :products do
    resources :reviews
  end
  resources :ratings, only: [:create, :update]
end
