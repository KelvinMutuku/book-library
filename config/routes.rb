Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "users/registrations" }
  
  root "books#index"

  resources :books, only: [:index, :show] do
    member do
      post "borrow"
      post "return"
    end
  end

  get "profile", to: "users#profile", as: :user_profile

  namespace :admin do
    get "dashboard", to: "dashboard#index"
    get "profile", to: "dashboard#profile"
    patch "update_profile", to: "dashboard#update_profile"
    resources :books, only: [:index, :new, :create, :destroy]  # Add `index`
  end
  
  
end
