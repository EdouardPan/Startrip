Rails.application.routes.draw do

  devise_for :users
  # Because this has helpers that can be called anywhere, one doesn't need
  # to nest this anywhere. Users reste à part.
  root to: 'stars#index'

  get '/profile', to: 'profiles#dashboard'
  # This route needs to be id-specific and made with devise

  # Search
  get '/stars/search', to: 'stars#search'

  resources :stars do
    resources :bookings, only: [:new, :create, :edit, :update, :destroy]
    resources :star_reviews, only: [:new, :create]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


end
