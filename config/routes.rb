Contacts::Application.routes.draw do
  resources :descriptors


  resources :tags


  resources :invitations

  get 'signup', to: 'users#new', as: 'signup'
  get 'signin', to: 'sessions#new', as: 'signin'
  get 'signout', to: 'sessions#destroy', as: 'signout'

  get '/accept/:invitation_token', :controller => 'users', :action => 'accept', :as => 'accept'
  post '/accept', :controller => 'users', :action => 'create_from_invitation', :as => 'accept_invitation'

  resources :users
  resources :sessions

  resources :subscriptions

  resources :groups

  resources :contacts do
    resources :notes
  end

  root :to => "pages#home"

  get 'about', to: 'pages#about'

  get 'try', to: 'pages#try', as: 'try'


end
