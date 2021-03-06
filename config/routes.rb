Rails.application.routes.draw do
  root to: 'welcome#show'

  resources :votes, only: %i(show new edit create update) do
    resources :sessions, only: %i(new create)
    resources :answers
  end
end
