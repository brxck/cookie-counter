Rails.application.routes.draw do
  devise_for :admins
  root 'pages#home'

  resources :items

  get  'items/:id/update', to: 'entries#new', as: 'new_entry'
  post 'items/:id/update', to: 'entries#create'
  get  'update', to: 'entries#index', as: 'entries'

  get  'items/:id/waste', to: 'wastes#new', as: 'new_waste'
  post 'items/:id/waste', to: 'wastes#create'
end
