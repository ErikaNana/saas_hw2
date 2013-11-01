class MoviesController < ApplicationController

  def show
    id = params[:id] # retrieve movie ID from URI route
    @movie = Movie.find(id) # look up movie by unique ID
    # will render app/views/movies/show.<extension> by default
  end

  def index
    @movies = Movie.all
    @all_ratings = Movie.getRatings
    redirect = false

    #decide whether or not to use params or session for sort
    if params[:sort]
      @sort = params[:sort]
    elsif session[:sort]
      @sort = session[:sort]
      redirect = true
    end

    #decide whether or not to use params or session for ratings
    if params[:ratings]
      @ratings = params[:ratings]
    elsif session[:ratings]
      @ratings = session[:ratings]
      redirect = true
    else #default
=begin
      @all_ratings.each do |rating|
        @ratings[rating] = true
      end
=end
    end


    if redirect
      redirect_to movies_path(:sort => @sort, :ratings => @ratings)
    end

      #update session so they can be persisted
      session[:sort] = @sort
      session[:ratings] = @ratings

      #sort and get the correct movies
      if sesson[:ratings]
        @checked = session[:ratings].keys
      end
      if session[:sort] == 'title'
        @movies = Movie.find(:all, :conditions =>{:rating =>@checked}, :order => 'title ASC')
      elsif session[:sort] = 'release_date'
        @movies = Movie.find(:all, :conditions =>{:rating =>@checked}, :order => 'release_date ASC')
      end
  end

  def new
    # default: render 'new' template
  end

  def create
    @movie = Movie.create!(params[:movie])
    flash[:notice] = "#{@movie.title} was successfully created."
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
