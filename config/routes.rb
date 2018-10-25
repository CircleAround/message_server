Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    resources :messages, only: [:index, :show, :create, :update, :destroy]

    post :sign_up, to: "registrations#sign_up"
    post :login, to: "registrations#login"
  end

  resources :messages
  resources :users
end
