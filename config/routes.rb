Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :soaps do
    resources :orders
  end
  resources :orders, only: [:destroy] do
    collection do
      post 'deliver', to: "orders#deliver"
    end
  end

end
