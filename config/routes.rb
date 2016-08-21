Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'pages#home'

  get '/signup' => 'users#new'
  post '/users' => 'users#create'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  get '/favorites' => 'favorites#index'
  get '/favorites/new' => 'favorites#new'
  post '/favorites' => 'favorites#create'
  get '/favorites/:id' => 'favorites#show'
  get '/favorites/edit' => 'favorites#edit'
  patch '/favorites' => 'favorites#update'
  delete '/favorites/:id' => 'favorites#destroy'

  get '/challenges' => 'challenges#index'
  get '/challenges/new' => 'challenges#new'
  post '/challenges' => 'challenges#create'
  get '/challenges/:id' => 'challenges#show'
  get '/challenges/:id/edit' => 'challenges#edit'
  patch '/challenges' => 'challenges#update'
  delete '/challenges/:id' => 'challenges#destroy'
end
