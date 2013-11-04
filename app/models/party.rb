class Party < ActiveRecord::Base
  has_many :pokemons
  accepts_nested_attributes_for :pokemons
end
