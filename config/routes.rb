Rails.application.routes.draw do
  devise_for :users
  root "books#index"

  resources :books, only: [:index, :show] do
    post 'borrow', to: 'borrowings#create'
    patch 'return', to: 'borrowings#update'
  end

  resource :user, only: [:show]
end