Rails.application.routes.draw do
  devise_for :users, controllers: {
            registrations: "users/registrations",
            passwords: "users/passwords"
          }
           
  devise_scope :user do
    post "users/guest_sign_in", to: "users/sessions#new_guest"
  end

  root to: "posts#index"
  resources :posts do
    # resources :likes, only: [:create, :destroy]
    resources :comments, only: [:create, :edit, :update, :destroy]
  end
end
