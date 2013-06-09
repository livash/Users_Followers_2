UsserFollow4::Application.routes.draw do
  resources :sessions
  resources :users, :except => :index
  resources :followings
  resources :users do
    resource :followings, :only => [:create, :destroy]
  end
end
