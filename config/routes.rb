Rails.application.routes.draw do
  root to: 'homes#top'
  devise_for :users

  resources :books, only: [:create, :index, :show, :delete, :edit]
  resources :users, only: [:show, :index, :edit]
  get 'homes/about' => 'homes#show'

end
