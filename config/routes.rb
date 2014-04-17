GreenReview::Application.routes.draw do
  root 'users#index'

  resources :products do
    resources :reviews
  end

  devise_for :users
end
