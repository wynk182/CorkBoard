Rails.application.routes.draw do

  get 'uploads/new'
  get 'upload' => 'uploads#new'
  resources :uploads
  resources :categories
  resources :boards do
    resources :posts
  end
  resources :responses
  get 'my_info' => 'owners#new'
  get 'my_info/:id' => 'owners#edit'
  get 'login' => 'owners#login'
  post 'recover' => 'owners#recover'
  post 'load_responses/:post_id' => 'responses#load_all'
  post 'load_boards' => 'boards#load_more'
  post 'search' => 'search#search'
  post 'login' => 'owners#auth'
  post 'my_info' => 'owners#create'
  patch 'my_info' => 'owners#update'
  # resources :owners
  get '/my_posts' => 'posts#my_posts'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'verify_posts' => 'posts#verify'
  post 'verify_posts/:post_id' => 'posts#verified'
  root 'posts#home'
end