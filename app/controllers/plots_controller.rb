class PlotsController < ApplicationController
  def index
    @garden = Garden.find(params[:garden_id])
    @plot = @garden.plots 
    @plant = PlotPlant.all 
  end

  def delete
      
  end
end 