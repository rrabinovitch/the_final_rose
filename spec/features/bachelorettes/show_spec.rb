require 'rails_helper'

RSpec.describe "When I visit a bachelorette's show page", type: :feature do
  before :each do
    @bachelorette_1 = Bachelorette.create!(name: "Hannah Brown", season_number: 15, season_description: "The Most Dramatic Season Yet!")
    @bachelorette_2 = Bachelorette.create!(name: "Suzie Q", season_number: 11, season_description: "Less dramatic than season 15!")
    @contestant_1 = @bachelorette_1.contestants.create!(name: "Pilot Pete", age: 34, hometown: "Irving, TX")
    @contestant_2 = @bachelorette_1.contestants.create!(name: "Ben Higgins", age: 28, hometown: "Los Angeles, CA")
    @contestant_3 = @bachelorette_2.contestants.create!(name: "Another Contestant", age: 24, hometown: "Denver, CO")
  end

  it "I see that bachelorette's name, season #, season description, and a link to see that bachelorette's contestants." do
    visit "/bachelorettes/#{@bachelorette_1.id}"
    expect(page).to have_content(@bachelorette_1.name)
    expect(page).to have_content("Season #{@bachelorette_1.season_number} - #{@bachelorette_1.season_description}")
    expect(page).to have_link("#{@bachelorette_1.name}'s Contestants")
  end

  it "And when I click on that link, I'm taken to an index page for that bachelorette's contestants." do
    visit "/bachelorettes/#{@bachelorette_1.id}"
    click_on "#{@bachelorette_1.name}'s Contestants"
    expect(current_path).to eq("/bachelorettes/#{@bachelorette_1.id}/contestants")
  end
end
