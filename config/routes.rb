Rails.application.routes.draw do
  devise_for :users
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
    resources :books, only: [:new, :create, :destroy]
  end
end
