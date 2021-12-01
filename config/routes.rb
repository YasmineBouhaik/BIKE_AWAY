Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "profile", to: "pages#profile"

  resources :rides, only: [:index, :show] do
    resources :participants, only: :create
    resources :messages, only: :create
  end

  resources :itineraries do
    resources :rides, only: :create
    resources :steps, only: :create
  end

  resources :steps, only: :destroy
end
