Amigosalao::Application.routes.draw do
  resources :people, only: [:new, :create, :destroy]
  resources :games, only: [:new, :create]
end
