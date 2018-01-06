Rails.application.routes.draw do

  get 'songs' => 'songs#dashboard'
  post 'songs' => 'songs#add'
  post 'songs/:id' => 'songs#like_song'
  get 'songs/:id' => 'songs#show'


  post 'sessions' => 'sessions#create'
  get '' => 'sessions#new'
  get 'main' => 'sessions#new'
  get 'sessions/logout' => 'sessions#destroy'

  post 'users' => 'users#new'
  get 'users/:id' => 'users#show'
  get 'users/listshow'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
