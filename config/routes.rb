Rails.application.routes.draw do
	root 'books#top'
  devise_for :users
  resources :books, only: [:new, :create, :index, :show, :top, :edit, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users, only: [:show, :index, :edit, :update]
end
