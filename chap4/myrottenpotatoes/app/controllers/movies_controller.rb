# This file is app/controllers/movies_controller.rb
class MoviesController < ApplicationController
  def index
    @movies = Movie.all #retrieves all movies in Movies table.
                        #instance variables defined in controller actions are available to views
    @all_ratings = Movie.all_ratings
  end
  # in app/controllers/movies_controller.rb

    def show
      id = params[:id] # retrieve movie ID from URI route
      @movie = Movie.find(id) # look up movie by unique ID
      # will render app/views/movies/show.html.haml by default
    end
    def new
        #default: render 'new' template
        #by default, every controller method automatically tries to render a template
        #with the corresponding name
    end
    def create
        #/value of params[:movie] is a hash of movie attribute names and values,
        #which we can pass along directly using Movie.create!(params[:movie])
        #flash[] is a special method that quacks like a hash, but persists from the current request
        #to the next.  If we put something into flash[] during the current controller action, we can
        #access it during the subsequent action
        #by convention, flash[:notice] is used for informational messages and flash[:warning] is used for
        #messages about things going wrong
        #redirect: triggers browser to start a brand-new HTTP request , the flash can be used to save a small
        #amount of information that will be made available to that new request
        @movie = Movie.create!(params[:movie])
        flash[:notice] = "#{@movie.title} was sucessfully created."
        redirect_to movies_path
    end
    def edit
      @movie = Movie.find params[:id]
    end

    def update
      @movie = Movie.find params[:id]
      @movie.update_attributes!(params[:movie])
      flash[:notice] = "#{@movie.title} was successfully updated."
      redirect_to movie_path(@movie)
    end
    def destroy
      @movie = Movie.find(params[:id])
      @movie.destroy
      flash[:notice] = "Movie '#{@movie.title}' deleted."
      redirect_to movies_path
    end
end