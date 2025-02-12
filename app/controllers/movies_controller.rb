class MoviesController < ApplicationController

  def index
    render({:template => "movie_templates/list"})
  end

  def show
    @movie_id = params.fetch("movie_id")
    matching_record = Movie.all.where({:id => @movie_id})
    @movie = matching_record[0]

    director_id = @movie.director_id
    @director = Director.all.where({:id => director_id})[0]

    render({:template => "movie_templates/details"})
  end

end
