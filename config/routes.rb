Rails.application.routes.draw do
  root 'fixed_pages#home'
  get  'help' => 'fixed_pages#help'
  get 'signup' => 'users#new'
  get 'login' => 'sessions#new'
  get 'allfeedbacks' => 'feedbacks#everything'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'
  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :users
  resources :microposts,    only: [:create, :destroy]
  resources :relationships, only: [:create, :destroy]
  resources :feedbacks

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
