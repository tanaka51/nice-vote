Rails.application.routes.draw do
  resources :votes, only: %i(show new create)
end
