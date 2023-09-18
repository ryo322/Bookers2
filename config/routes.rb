Rails.application.routes.draw do
  get "search" => "searchs#search"
  devise_for :users
  root to: 'homes#top'
  get 'homes/top'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'home/about' => 'homes#about'
  resources :books do
    resource :favorites, only: [:create, :destroy]
    resources :comments, only: [:create, :destroy]
  end
  resources :users do
   member do
      get :follows, :followers
    end
      resource :relationships, only: [:create, :destroy]
  end 
end
