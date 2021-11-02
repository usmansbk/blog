Rails.application.routes.draw do
  root 'users#index'

  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show]
  end

  resources :posts, only: [:new] do
    resources :comments, only: [:create]
    resources :likes, only: [:create]
  end

  post '/posts/new', to: 'posts#create', as: 'create_post'

end
