Rails.application.routes.draw do
  get "home/about" => 'homes#about'
  root 'books#top'
  devise_for :users
  resources :books, only: [:new, :create, :index, :show, :top, :edit, :destroy, :update]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:show, :index, :edit, :update]
end
