Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
<<<<<<< HEAD
resources :soaps, only: [:index, :show, :new, :create]
=======
  resources :soaps, only: [:index, :new, :create, :show]
>>>>>>> 07a78058b277b3e23da014ba55d0caf4d5856ac7
end
