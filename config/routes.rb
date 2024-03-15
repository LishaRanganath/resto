Rails.application.routes.draw do
  root to: 'main#index'
  get 'menu' , to: 'menu#list'

  get 'signup' , to: 'signup#new'
  post 'signup', to: 'signup#create'

  get 'login', to:'login#new'
  post 'login', to:'login#create'

  delete '/logout', to: 'login#destroy', as: :logout


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
