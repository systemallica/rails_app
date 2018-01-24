Rails.application.routes.draw do
  root to: 'katas#index'
  
  get '/katas/:id' => 'katas#show', as: :kata
  patch '/katas/:id' => 'katas#update'
  delete '/katas/:id' => 'katas#delete', as: :delete_katas
  get '/new/katas' => 'katas#new', as: :new_kata
  post '/create/katas' => 'katas#create', as: :create_katas
  get '/edit/katas/:id' => 'katas#edit', as: :edit_katas
end
