Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/users/new" => "users#new", as: "signup"
  post "/users/create" => "users#create"
  get "/hello" => "users#hello", as: "hello"

  post "/sessions/create" => "sessions#create"
end
