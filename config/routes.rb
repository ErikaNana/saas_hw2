Rottenpotatoes::Application.routes.draw do

  resources :movies

  # Route that posts 'Search TMDb form'
  # route to controller action search_tmdb
  # triggers post when a form is POSTed
  post '/movies/search_tmdb'
end
