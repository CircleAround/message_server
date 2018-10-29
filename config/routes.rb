Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    resources :messages, only: [:index, :show, :create, :update, :destroy] do
      resources :images, only: :create
    end

    post :sign_up, to: "registrations#sign_up"
    post :login, to: "registrations#login"
  end

  resources :messages
  resources :users

  root to: 'messages#index'
end