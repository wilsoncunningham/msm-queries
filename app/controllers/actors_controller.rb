class ActorsController < ApplicationController

  def index
    render({:template => "actor_templates/list"})
  end

  def show
    @actor_id = params.fetch("actor_id")
    matching_record = Actor.all.where({:id => @actor_id})
    @actor = matching_record[0]

    @matching_characters = Character.where({:actor_id => @actor.id})

    render({:template => "actor_templates/details"})
  end

end
