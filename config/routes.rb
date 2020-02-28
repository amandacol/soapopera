Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :soaps, only: [:index, :show, :new, :create, :destroy] do
    resources :orders, only: [:new, :create, :index]
  end
  resources :orders, only: [:destroy]
end
