Rails.application.routes.draw do
  get 'users/show'
  get 'cards/new'
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users/registrations'
  }
  
  root "items#index"
  resources :items do
    resources :orders, only: [:index, :create]
    resources :comments, only: [:create]
    resource :favorites, only: [:create, :destroy]
    collection do
      get 'search'
    end
  end  
  resources :cards, only: [:new, :create]
  resources :users, only: [:show, :update]


end
