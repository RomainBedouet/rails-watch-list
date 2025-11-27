Rails.application.routes.draw do
  get 'bookmarks/new'
  get 'bookmarks/create'
  get 'bookmarks/destroy'
  get 'lists/index'
  get 'lists/show'
  get 'lists/new'
  get 'lists/create'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  # Routes pour les listes
  get 'lists', to: 'lists#index'          # Voir toutes les listes
  get 'lists/new', to: 'lists#new', as: 'new_list'  # Formulaire pour créer une liste
  post 'lists', to: 'lists#create'        # Créer une liste
  get 'lists/:id', to: 'lists#show', as: 'list'  # Voir les détails d'une liste

  # Routes pour les bookmarks (nestées dans les listes)
  get 'lists/:list_id/bookmarks/new', to: 'bookmarks#new', as: 'new_list_bookmark'  # Formulaire pour ajouter un film à une liste
  post 'lists/:list_id/bookmarks', to: 'bookmarks#create'  # Créer un bookmark
  delete 'bookmarks/:id', to: 'bookmarks#destroy'  # Supprimer un bookmark

  # Route racine
  root to: 'lists#index'
  # Defines the root path route ("/")
  # root "posts#index"
end
