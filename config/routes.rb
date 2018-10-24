Rails.application.routes.draw do
  namespace :api do
    resources :messages
  end
  namespace :api do
    resources :users
  end
  resources :messages
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
