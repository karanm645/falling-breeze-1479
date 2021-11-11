require 'rails_helper'

RSpec.describe "Show Page" do 
  before :each do 
    @turing_garden = Garden.create!(name: 'Turing Community Garden', organic: true)
    @library_garden = Garden.create!(name: 'Public Library Garden', organic: true)
    @other_garden = Garden.create!(name: 'Main Street Garden', organic: false)

    @shady = @turing_garden.plots.create!(number: 25, size: "Large", direction: "East")
    @sunny = @turing_garden.plots.create!(number: 26, size: "Small", direction: "West")
    @wet = @other_garden.plots.create!(number: 2, size: "Small", direction: "South")
    
    @carrot = Plant.create!(name: "Carrot", description: "orange", days_to_harvest: 25)
    @aloe = Plant.create!(name: "Aloe Vera", description: "medicine", days_to_harvest: 100)
    @tulsi = Plant.create!(name: "Tulsi", description: "fresh", days_to_harvest: 5)

    @carrot_shady = PlotPlant.create!(plant: @carrot, plot: @shady)
    @aloe_sunny = PlotPlant.create!(plant: @aloe, plot: @sunny)
    @tulsi_wet = PlotPlant.create!(plant: @tulsi, plot: @wet)
    visit "/gardens/#{@turing_garden.id}"
  end 

  describe 'When I visit the show page' do 
    it 'has a list of plants that are included in that garden/s plots' do 
      save_and_open_page 
      expect(page).to have_content(@aloe.name)
      expect(page).to_not have_content(@tulsi.name)
    end  
  end 
end 