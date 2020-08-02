require 'rails_helper'

RSpec.describe "When I visit a bachelorette's contestants index page", type: :feature do
  before :each do
    @bachelorette_1 = Bachelorette.create!(name: "Hannah Brown", season_number: 15, season_description: "The Most Dramatic Season Yet!")
    @bachelorette_2 = Bachelorette.create!(name: "Suzie Q", season_number: 11, season_description: "Less dramatic than season 15!")
    @contestant_1 = @bachelorette_1.contestants.create!(name: "Pilot Pete", age: 34, hometown: "Irving, TX")
    @contestant_2 = @bachelorette_1.contestants.create!(name: "Ben Higgins", age: 28, hometown: "Los Angeles, CA")
    @contestant_3 = @bachelorette_2.contestants.create!(name: "Another Contestant", age: 24, hometown: "Denver, CO")
  end

  it "I only see that bachelortette's contestants and each of their names, ages, and hometowns." do
    visit "/bachelorettes/#{@bachelorette_1.id}"
    click_on "#{@bachelorette_1.name}'s Contestants"
    expect(current_path).to eq("/bachelorettes/#{@bachelorette_1.id}/contestants")
    expect(page).to have_content("Name: #{@contestant_1.name}")
    expect(page).to have_content("Age: #{@contestant_1.age}")
    expect(page).to have_content("Hometown: #{@contestant_1.hometown}")
    expect(page).to have_content("Name: #{@contestant_2.name}")
    expect(page).to have_content("Age: #{@contestant_2.age}")
    expect(page).to have_content("Hometown: #{@contestant_2.hometown}")
    expect(page).to_not have_content(@contestant_3.name)
  end

  it "A contestant's name links to that contestant's show page." do
    visit "/bachelorettes/#{@bachelorette_1.id}/contestants"
    within(".contestant-#{@contestant_1.id}") do
      expect(page).to have_link(@contestant_1.name)
      click_on "#{@contestant_1.name}"
    end
    expect(current_path).to eq("/contestants/#{@contestant_1.id}")
  end
end
