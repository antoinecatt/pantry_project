Pantry::Application.routes.draw do
root 'ingredients#new'
resources :ingredients
end
