Rails.application.routes.draw do
  post 'users' => 'users#new'
  post 'sessions' => 'sessions#create'
  get 'sessions/new'
  get '' => 'sessions#new'
  get 'sessions/logout' => 'sessions#destroy'

  get 'users/:id/show' => 'users#show'
  get 'users/listshow'

  get 'users/edit'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
