Rails.application.routes.draw do

  get 'songs/dashboard'

  get 'songs/show'

  post 'users' => 'users#new'
  post 'sessions' => 'sessions#create'
  get '' => 'sessions#new'
  get 'main' => 'sessions#new'
  get 'sessions/logout' => 'sessions#destroy'

  get 'users/:id/show' => 'users#show'
  get 'users/listshow'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
