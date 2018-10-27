Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    resources :messages, only: [:index, :show, :create, :update, :destroy] do
      post 'images', to: 'attach_image', on: :member
    end

    post :sign_up, to: "registrations#sign_up"
    post :login, to: "registrations#login"
  end

  resources :messages do
    post 'images', to: 'messages#attach_image', on: :member
  end
  resources :users

  root to: 'messages#index'
end
