Rails.application.routes.draw do
  root to: 'posts#index'
  devise_for :users, controllers: {
            omniauth_callbacks: "users/omniauth_callbacks",
            registrations: "users/registrations",
            passwords: "users/passwords"
          }
           
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end

  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
  end

  # post "like/:id" => "likes#create", as: "create_like"
  # delete "like/:id" => "likes#destroy", as: "destroy_like"

  resources :users do
    member do
      get :following, :followers
    end
  end

  resources :posts do
    resources :likes, only: [:create]
    resource :like, only: [:destroy]
    resources :comments, only: [:create]
  end
  resources :comments, only: [:edit, :update, :destroy]
end
