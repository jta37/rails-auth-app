Rails.application.routes.draw do
  get "/login", to: "sessions#new"

  # when you see a #create, realize it will always be a post
  post "/sessions", to: "sessions#create"

  get "/sign_up", to: "users#new", as: "sign_up"

  # creates the new, index, show, edit routes for users, 
  # along with post, patch and delete(post, update, destroy)
  resources :users

end
