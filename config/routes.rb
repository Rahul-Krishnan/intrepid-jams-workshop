Rails.application.routes.draw do
  # get '/games' => 'games#index'
  resources :games, only: [:index]
  resources :teams, only: [:index, :show]
end
