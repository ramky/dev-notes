Rails.application.routes.draw do
  resources :topics do
    resources :notes
  end
  resources :types
end
