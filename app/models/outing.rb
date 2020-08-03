class Outing <ApplicationRecord
  has_many :contestant_outings
  has_many :contestants, through: :contestant_outings

  def contestants_count
    contestants.count
  end

  def contestant_names
    contestants.pluck(:name)
  end
end
