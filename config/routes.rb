Rails.application.routes.draw do
  resources :poketeams, except: [:new, :edit]
  resources :ratings, except: [:new, :edit]
  resources :comments, except: [:new, :edit]
  resources :moves, except: [:new, :edit]
  resources :types, except: [:new, :edit]
  resources :pokemons, except: [:new, :edit]
  # get '/pokemon' => 'pokemon#show'
  # get '/pokemon/:id' => 'pokemon#index'
  resources :examples, except: [:new, :edit]
  post '/sign-up' => 'users#signup'
  post '/sign-in' => 'users#signin'
  delete '/sign-out/:id' => 'users#signout'
  patch '/change-password/:id' => 'users#changepw'
  resources :users, only: [:index, :show]
end
