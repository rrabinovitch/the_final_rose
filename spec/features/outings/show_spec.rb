require 'rails_helper'

RSpec.describe "When I visit an outings show page" do
  before :each do
    @bachelorette_1 = Bachelorette.create!(name: "Hannah Brown", season_number: 15, season_description: "The Most Dramatic Season Yet!")
    @contestant_1 = @bachelorette_1.contestants.create!(name: "Pilot Pete", age: 34, hometown: "Irving, TX")
    @contestant_2 = @bachelorette_1.contestants.create!(name: "Ben Higgins", age: 28, hometown: "Los Angeles, CA")
    @contestant_3 = @bachelorette_1.contestants.create!(name: "Another Contestant", age: 24, hometown: "Denver, CO")
    @outing_1 = Outing.create!(name: "Kickball", location: "Marfa, TX", date: Date.new(2019,5,12))
    ContestantOuting.create!(contestant_id: @contestant_1.id, outing_id: @outing_1.id)
    ContestantOuting.create!(contestant_id: @contestant_2.id, outing_id: @outing_1.id)
    ContestantOuting.create!(contestant_id: @contestant_3.id, outing_id: @outing_1.id)
  end

  it "I see that outing's name, location, and date." do
    visit "/outings/#{@outing_1.id}"
    expect(page).to have_content(@outing_1.name)
    expect(page).to have_content("Location: #{@outing_1.location}")
    expect(page).to have_content("Date: #{@outing_1.date}")
  end

  it "I see a total count of contestants that were on the outing and each contestant's name." do
    visit "/outings/#{@outing_1.id}"
    expect(page).to have_content("Count of contestants: 3")
    expect(page).to have_content("Contestants: #{@contestant_1.name}, #{@contestant_2.name}, #{@contestant_3.name}")
  end
end
