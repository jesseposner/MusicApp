Rails.application.routes.draw do
  resources :users, only: [:create, :new, :show]
  resources :bands
  resource :session, only: [:create, :new, :destroy]
end
