Rails.application.routes.draw do

  mount ActionCable.server => '/cable'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :sessions
      resources :users
      resources :games
      resources :groups
      resources :invites
      resources :messages
      resources :honors

      post '/auth' => 'sessions#create'
      get '/current_user' => 'sessions#show'
      post '/honor' => 'honors#handle_honor'

      post '/addRemoveGame' => 'users#addRemoveGame'
    end
  end
end
