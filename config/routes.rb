Rails.application.routes.draw do
  root 'home#index'

  namespace :admin do
    resources :orders
    resources :items, except: :edit
  end

  resources :measurements, only: [:index, :create, :update]
  resources :users, only: [:new, :create, :update]
  resources :orders
  resources :cart, only: :index

  # Items
  get  'items/:id'     => 'items#show', as: 'item'
  post 'items/:id/add' => 'items#add' , as: 'add_item'

  # Login
  get  'login'        => 'login#index'
  get ' login/reset'  => 'login#reset'
  post 'login'        => 'login#login'
  post 'login/logout' => 'login#logout'
  post 'login/reset'  => 'login#reset_password'
end
