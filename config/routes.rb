Rails.application.routes.draw do
  devise_for :admins
  root 'pages#home'

  resources :items

  get  'items/:id/update', to: 'entries#new'
  post 'items/:id/update', to: 'entries#create'
  get  'items/:id/history', to: 'entries#index'

  resources :entries, except: %i[new create index]
end
