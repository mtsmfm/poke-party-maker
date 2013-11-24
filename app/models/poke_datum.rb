class PokeDatum < ActiveRecord::Base
  scope :available_in_rating, -> { where available_in_rating: true }
  scope :final, -> { where final: true }
end
