Rails.application.routes.draw do
  resources :votes, only: %i(show new create update) do
    resources :sessions, only: %i(new create)
    resources :answers
  end
end
