Rails.application.routes.draw do
  devise_for :users
  get 'posts/index'

  get 'posts/new'

  get 'posts/edit'

  resources :posts
  root "posts#index"

  
end
