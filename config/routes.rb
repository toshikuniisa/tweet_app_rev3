Rails.application.routes.draw do

  resources :videos
  root 'home#top'

  resources :posts do
  resources :likes, only: [:create, :destroy]
  end


  devise_for :users,controllers:{
    registrations: 'users/registrations'
  }
  get '/mypage' => 'users#mypage'
  resources :users, only: [:show,:edit,:update]
  resources :relationships, only: [:create, :destroy]
 end
