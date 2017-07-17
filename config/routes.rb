Rails.application.routes.draw do
  root 'users#index'
  

  post 'users' => 'users#create'
  post 'users/authenticate' => 'users#authenticate'

  get 'tasks/show' => 'tasks#show'
  get 'tasks/hide' => 'tasks#hide'
  get 'tasks/unhide' => 'tasks#unhide'
  get 'tasks/new' => 'tasks#new'
  post 'tasks' => 'tasks#create'



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
