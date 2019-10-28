Rails.application.routes.draw do
  resources :users, only: %i[new create]

  root 'users#new'
end
