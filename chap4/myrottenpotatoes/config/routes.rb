Myrottenpotatoes::Application.routes.draw do
  #this creates a whole variety of helper methods for RESTful URIs
  resources :movies
  root :to => redirect('/movies') #allows us to set up a group of related routes for CRUD actions on a RESTful resource
end