require 'rails_helper'

RSpec.describe "When I visit a contestants show page" do
  before :each do
    @bachelorette_1 = Bachelorette.create!(name: "Hannah Brown", season_number: 15, season_description: "The Most Dramatic Season Yet!")
    @contestant_1 = @bachelorette_1.contestants.create!(name: "Pilot Pete", age: 34, hometown: "Irving, TX")
    @outing_1 = Outing.create!(name: "Kickball", location: "Marfa, TX", date: Date.new(2019,5,12))
    @outing_2 = Outing.create!(name: "Hot Springs", location: "Idaho Springs, CO", date: Date.new(2019,5,15))
    ContestantOuting.create!(contestant_id: @contestant_1.id, outing_id: @outing_1.id)
    ContestantOuting.create!(contestant_id: @contestant_1.id, outing_id: @outing_2.id)
  end

  it "I see that contestant's name, season number, season description, and the names of the outings they've been on.
        And when I click on an outing's name, I'm taken to that outing's show page." do
    visit "/contestants/#{@contestant_1.id}"
    expect(page).to have_content(@contestant_1.name)
    expect(page).to have_content("Season #{@contestant_1.bachelorette.season_number} - #{@contestant_1.bachelorette.season_description}")
    expect(page).to have_link(@outing_1.name)
    expect(page).to have_link(@outing_2.name)
    click_on "#{@outing_1.name}"
    expect(current_path).to eq("/outings/#{@outing_1.id}")
  end
end
