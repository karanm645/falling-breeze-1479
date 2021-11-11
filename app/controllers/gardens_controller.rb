class GardensController < ApplicationController
  def show
    @garden = Garden.find(params[:id])
    @plot = @garden.plots 
    @plant = PlotPlant.all 
  end
end 