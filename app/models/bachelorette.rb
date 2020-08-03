class Bachelorette <ApplicationRecord
  has_many :contestants

  def avg_contestant_age
    contestants.average(:age)
  end
end
