class RoadTrip < ApplicationRecord
  validates :origin, presence: true
  validates :destination, presence: true

  belongs_to :user
end
