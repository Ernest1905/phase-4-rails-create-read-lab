class PlantsController < ApplicationController
    def index 
      plants = Plant.all.select(:id, :name, :image, :price)
      render json: plants
    end 
  
    def show
      plant = Plant.find_by(id: params[:id])
      if plant
        render json: plant, status: :ok
      else  
        render json: { error: "Plant not found" }, status: :not_found
      end
    end  
  
    def create 
      new_plant = Plant.create(plant_params)
      render json: new_plant, status: :created
    end
  
    private 
    def plant_params
      params.permit(:name, :image, :price)    
    end          
  end
  