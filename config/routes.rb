Rails.application.routes.draw do
  devise_for :users, controllers: {sessions: "users/sessions"}
  resources :users, only: [:index]
  root 'posts#index'
  # root controller: :rooms, action: :index
  get 'timeline',to:'posts#timeline'
  get 'my_groups',to:'groups#my_groups'
  get 'my_pages',to:'pages#my_pages'
  get 'search',to:'welcome#search'
  resources :room_messages
  resources :rooms
  resources :profiles
  resources :friend_requests
  resources :friendships
  resources :posts do
    resources :reactions
    member do
      patch :like
      patch :dislike
    end
    resources :comments
  end

  resources :comments do
    resources :comments
  end

  resources :groups
  resources :group_users
  resources :pages
  resources :page_followers
  

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
