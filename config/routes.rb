Rails.application.routes.draw do
  root to: 'posts#index'
  devise_for :users, controllers: {
            registrations: "users/registrations",
            passwords: "users/passwords",
          }
           
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end

  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
  end

  resources :posts do
    # resources :likes, only: [:create, :destroy]
    resources :comments, only: [:create]
  end
  resources :comments, only: [:edit, :update, :destroy]
end
