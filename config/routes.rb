Rails.application.routes.draw do
  post 'users/new' => 'users#new'

  get 'users/:id/show' => 'users#show'
  get 'users/listshow'

  get 'users/edit'

  get 'sessions/new'
  get '' => 'sessions#new'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
