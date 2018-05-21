Rails.application.routes.draw do
  get 'index/star_reviews'
  get 'index/new'
  get 'index/create'
  get 'bookings/new'
  get 'bookings/create'
  get 'bookings/edit'
  get 'bookings/update'
  get 'bookings/destroy'
  get 'stars/new'
  get 'stars/create'
  get 'stars/top'
  get 'stars/edit'
  get 'stars/update'
  get 'stars/destroy'
  get 'stars/show'
  get 'stars/index'
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
