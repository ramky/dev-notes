Rails.application.routes.draw do
  root to: 'topics#index'

  resources :topics do
    resources :notes
  end

  resources :types
  resources :sessions, only: [:new, :create, :destroy]

  # match 'auth/:provider/callback', to: 'sessions#create', via: [:get, :post]
  # match 'auth/failure', to: redirect('/'), via: [:get, :post]
  match 'sign_out', to: 'sessions#destroy', as: 'sign_out', via: [:get, :post]
  match 'sign_in', to: 'sessions#new', as: 'sign_in', via: [:get]

  get 'search', to: 'search#search'
end
