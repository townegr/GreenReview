GreenReview::Application.routes.draw do
  root 'users#index'

  resources :products do
    resources :reviews
  end
  resources :ratings, only: [:create, :update]
  devise_for :users
end
