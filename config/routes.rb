Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    resources :messages
    resource :user, only: [:show, :update, :destroy]

    post :sign_up, to: "registrations#sign_up"
    post :login, to: "registrations#login"
  end

  resources :messages
  resources :users
end
