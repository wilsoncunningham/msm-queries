class DirectorsController < ApplicationController

  def index
    render({:template => "director_templates/list"})
  end

  def show
    @director_id = params.fetch("director_id")
    matching_record = Director.all.where({:id => @director_id})
    @director = matching_record[0]

    render({:template => "director_templates/details"})
  end

end
