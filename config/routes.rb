Rails.application.routes.draw do
  resources :videos
  root 'home#top'
  resources :posts do
  resources :likes, only: [:create, :destroy]
  end


  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end