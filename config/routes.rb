Rails.application.routes.draw do
  root to: 'main#index'
  get 'menu' , to: 'menu#list'

  get 'signup' , to: 'signup#new'
  post 'signup', to: 'signup#create'

  get 'login', to:'login#new'
  post 'login', to:'login#create'

  delete 'logout', to: 'login#destroy'

  get 'order_item', to: 'order_item#list'
  post 'order_item', to: 'order_item#create'
  put 'order_item', to: 'order_item#decrement'

  post 'cart', to: 'cart#create'
  put 'cart', to: 'cart#decrement'

  get 'search', to: 'search#index'

  post 'menu', to: 'order_item#create'
  put 'menu', to: 'order_item#decrement'

  # get 'payment', to: 'payment#index'
  post 'payment', to: 'payment#index'
  #  resources :order_item, only: [:create]



  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
