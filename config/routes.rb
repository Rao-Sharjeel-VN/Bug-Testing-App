Rails.application.routes.draw do
  # get 'bugs/index'
  # get 'bugs/show'
  # get 'bugs/edit'
  # get 'bugs/destroy'
  # get 'bugs/new'

  resources :bugs
  resources :projects
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "projects#index"

  # root :to => redirect("/users/sign_in")
  # devise_scope :user do
 
  #   root :to => "devise/registrations#new"

  # end

  # unauthenticated do
  #   root '/users/sign_up'
  # end
  
  # authenticated do
  #   root '/projects'
  #   # resources :things
  # end

end
