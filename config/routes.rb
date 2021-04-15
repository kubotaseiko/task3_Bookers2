Rails.application.routes.draw do
  root to: 'homes#top'
  devise_for :users

  resources :books, only: [:create, :index, :show, :destroy, :edit, :update]
  resources :users, only: [:show, :index, :update, :edit]
  get 'home/about' => 'homes#show'

end
