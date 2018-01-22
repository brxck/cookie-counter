Rails.application.routes.draw do
  devise_for :admins
  root 'pages#home'

  resources :items

  get  'items/:id/update', to: 'entries#new', as: 'new_entry'
  get  'items/:id/history', to: 'entries#index', as: 'entries'

  resources :entries, except: %i[new index]
end
