Pantry::Application.routes.draw do
devise_for :users


root to: "ingredients#index"
#root 'ingredients#new'
resources :ingredients
get '/details/:id' => 'ingredients#details'
get '/list/:name' => 'ingredients#list'

end
