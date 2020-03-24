Rails.application.routes.draw do
  devise_for :users
  resources :users,only: [:show,:index,:edit,:update] do
  member do
  	get :follower, :followed
  end
end
  resources :relationships, only: [:follow, :unfollow]

  post 'followed/:id' => 'relationships#follow', as: 'follow'   # フォロー
  post 'unfollow/:id' => 'relationships#unfollow', as: 'unfollow'  # フォローを外す
  resources :books do
  	  resource :favorites, only: [:create, :destroy]
  	  resource :book_comments, only: [:create, :destroy]
  end
  root 'home#top'
  get 'home/about'
end
