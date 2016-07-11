Rails.application.routes.draw do
  mount ActionCable.server => '/cable' # tell ActionCable to listen on ws://localhost:3000/cable for socket requests (server side)
  resources :subtasks
  resources :to_dos
  resources :notes
  root 'notes#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
