Rails.application.routes.draw do
  get 'chats/show'
  root to: 'homes#top'
  devise_for :users, controllers: {
    registrations: "users/registrations"
  }

  resources :books, only: [:new, :create, :index, :show, :destroy, :edit, :update] do
    resource :favorites, only: [:create, :destroy]
    resources :book_comments, only: [:create, :destroy]
  end

  resources :users, only: [:show, :index, :update, :edit] do
    member do
      get :followings, :followers
    end
  end

  resources :relationships, only:[:create, :destroy]

  get '/search' => 'search#search'

  get 'home/about' => 'homes#show'
  
  get 'chat/:id', to: 'chats#show', as: 'chat'
  resources :chats, only: [:create]


end
