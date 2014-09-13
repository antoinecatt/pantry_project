Pantry::Application.routes.draw do
devise_for :users


resources :ingredients do
  get 'search', on: :collection
end
root to: "ingredients#index"

get '/details/:id' => 'ingredients#details'
get '/list/:name' => 'ingredients#list'

end
