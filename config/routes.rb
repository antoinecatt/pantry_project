Pantry::Application.routes.draw do
root 'ingredients#new'
resources :ingredients
get '/details/:id' => 'ingredients#details'
end
