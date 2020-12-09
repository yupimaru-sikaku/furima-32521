Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"
  resources :items do
    resources :orders, only: [:index, :create]
    resources :comments, only: [:create]
    resource :favorites, only: [:create, :destroy]
    collection do
      get 'search'
    end
  end  
end
