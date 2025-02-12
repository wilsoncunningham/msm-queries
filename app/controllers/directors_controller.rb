class DirectorsController < ApplicationController

  def index
    render({:template => "director_templates/list"})
  end

  def show
    @director_id = params.fetch("director_id")
    matching_record = Director.all.where({:id => @director_id})
    @director = matching_record[0]

    @matching_movies = Movie.where({:director_id => @director.id})

    render({:template => "director_templates/details"})
  end

  def display_youngest
    directors_by_age = Director.where.not({ :dob => nil }).order({:dob => :desc})
    @youngest_director = directors_by_age[0]

    render({:template => "director_templates/youngest"})
  end

  def display_eldest
    directors_by_age = Director.where.not({ :dob => nil }).order({:dob => :desc})
    @eldest_director = directors_by_age[-1]

    render({:template => "director_templates/eldest"})
  end

end
