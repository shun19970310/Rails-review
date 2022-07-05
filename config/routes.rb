Rails.application.routes.draw do

  devise_for :users
  root 'homes#top'
  resources :ramen_shops, only: [:index, :show] do
    resources :reviews, only: [:index, :create]
  end
  resources :users do
    resource :relationships, only: [:create, :destroy]
    get :followings, on: :member
    get :followers, on: :member
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
