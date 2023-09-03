Rails.application.routes.draw do
  root to: 'homes#top'
  get 'homes/top'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'homes/about' => 'homes#about'
  resources :books
end
