Rails.application.routes.draw do
  resource :messages do
    collection do
      post 'reply'
    end
  end
  get '/comments' => 'comments#index'
  post '/comments' => 'comments#create'
  
  post 'tokens' => "tokens#create"
  
  get 'messages/reply'

  namespace :api do
    namespace :v1 do
      get '/comments' => 'comments#index'
      post '/comments' => 'comments#create'
      get '/challenges' => 'challenges#index'
      post 'challenges' => 'challenges#create'
      get 'challenges/:id' => 'challenges#show'
      patch 'challenges/:id' => 'challenges#update'
      delete 'challenges/:id' => 'challenges#destroy'
    end
  end

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

  mount ActionCable.server => '/cable'
end
