Rails.application.routes.draw do
  root 'fixed_pages#home'
  get  'help' => 'fixed_pages#help'
  get 'signup' => 'users#new'
  resources :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
