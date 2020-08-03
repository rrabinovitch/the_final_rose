require 'rails_helper'

RSpec.describe Bachelorette, type: :model do
  describe 'relationships' do
    it {should have_many :contestants}
  end

  describe 'methods' do
    it "#avg_contestant_age" do
      @bachelorette_1 = Bachelorette.create!(name: "Hannah Brown", season_number: 15, season_description: "The Most Dramatic Season Yet!")
      @contestant_1 = @bachelorette_1.contestants.create!(name: "Pilot Pete", age: 34, hometown: "Irving, TX")
      @contestant_2 = @bachelorette_1.contestants.create!(name: "Ben Higgins", age: 28, hometown: "Los Angeles, CA")
      expect(@bachelorette_1.avg_contestant_age).to eq(31)
    end

    it "#contestant_hometowns" do
      @bachelorette_1 = Bachelorette.create!(name: "Hannah Brown", season_number: 15, season_description: "The Most Dramatic Season Yet!")
      @contestant_1 = @bachelorette_1.contestants.create!(name: "Pilot Pete", age: 34, hometown: "Irving, TX")
      @contestant_2 = @bachelorette_1.contestants.create!(name: "Ben Higgins", age: 28, hometown: "Los Angeles, CA")
      @contestant_3 = @bachelorette_1.contestants.create!(name: "Another One", age: 32, hometown: "Los Angeles, CA")
      expect(@bachelorette_1.contestant_hometowns).to eq(["Irving, TX", "Los Angeles, CA"])
    end
  end
end
