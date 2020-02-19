class BirdsController < ApplicationController
  def index
    birds = Bird.all
    render json: birds, only: [:id, :name, :species] #Or birds.to_json(except: [:created_at, :apdated_at])
  end

  def show 
    bird = Bird.all.find_by(id: params[:id])
    if bird
      render json: bird.slice(:id, :name, :species) #{id: bird.id, name: bird.name, species: bird.species}
    else 
      render json: {message: "Bird not found!"}
    end
  end
end