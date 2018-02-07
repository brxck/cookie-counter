Rails.application.routes.draw do
  resources :employees
  devise_for :admins

  root "pages#home"
  get "admin", to: "pages#admin_panel", as: "admin_panel"
  get "about", to: "pages#about", as: "about"

  resources :items
  get "search", to: "items#search"

  get  "items/:id/update", to: "entries#new", as: "new_entry"
  post "items/:id/update", to: "entries#create"
  get  "update", to: "entries#index", as: "entries"
  post "update", to: "entries#update", as: "update_entries"

  get  "items/:id/waste", to: "wastes#new", as: "new_waste"
  post "items/:id/waste", to: "wastes#create"
  get  "waste", to: "wastes#index", as: "wastes"
end
