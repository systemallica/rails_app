Rails.application.routes.draw do
  root to: 'katas#index'
  
  get '/kata/:id' => 'katas#show', as: :kata
end
