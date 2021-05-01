Rails.application.routes.draw do
  root to: 'homes#top'
  devise_for :users

  resources :books, only: [:new, :create, :index, :show, :destroy, :edit, :update] do
    resource :favorites, only: [:create, :destroy]
    resources :post_comments, only: [:create, :destroy]
  end

  resources :users, only: [:show, :index, :update, :edit]
  get 'home/about' => 'homes#show'

end
