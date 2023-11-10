class MoviesController < ApplicationController
  def index
    matching_movies = Movie.all
    @list_of_movies = matching_movies.order({ :created_at => :desc })

    render({ :template => "movie_templates/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_movies = Movie.where({ :id => the_id })
    @the_movie = matching_movies.at(0)

    render({ :template => "movie_templates/show" })
  end

  def create
    #retrieve user input from params
    m = Movie.new
    m.title = params.fetch("the_title")
    m.year = params.fetch("the_year")
    m.duration = params.fetch("the_duration")
    m.description = params.fetch("the_description")
    m.image = params.fetch("the_image")
    m.director_id = params.fetch("the_director_id")
    m.save

    redirect_to("/movies")
    #create a record in the table
    
    #populate each column with user input
    
    #save
    
    #redirect the user back to the movies index page
  end

  def delete
    movie_id = params.fetch("movie_id")
    this_movie = Movie.where({:id => movie_id}).at(0)
    this_movie.destroy

    redirect_to("/movies")
  end

  def modify
    movie_id = params.fetch("movie_id")
    this_movie = Movie.where({:id => movie_id}.at(0)

    this_movie.title = params.fetch("the_title")
    this_movie.year = params.fetch("the_year")
    this_movie.year = params.fetch("the_duration")
    this_movie.description = params.fetch("the_description")
    this_movie.image = params.fetch("the_image")
    this_movie.director_id = params.fetch("the_director_id")
    
    this_movie.save

    redirect_to("/movies/:movie_id")
  end 
end
