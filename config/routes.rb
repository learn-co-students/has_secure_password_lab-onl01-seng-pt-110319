Rails.application.routes.draw do
  resources :users, only:[:new,:create, :show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #get 'signup', to: 'users#signup'
  get '/login', to: 'users#login'
  post '/create', to: 'sessions#create'
  post '/logout', to: 'sessions#destroy'

end
