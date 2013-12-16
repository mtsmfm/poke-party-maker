class Party < ActiveRecord::Base
  has_and_belongs_to_many :pokemons

  class << self
    def build_at_random(available:, chosen:, size: 6)
      raise ArgumentError if size > available.size + chosen.size

      pokemons = chosen + available.sample(size - chosen.size)

      self.new(pokemons: pokemons)
    end

    def build_nicely(available: , chosen:)
      population = build_population(available: available, chosen: chosen)

      population.max_by {|party| judge(party) }
    end

    private

    def judge(party)
      party.compatibilities.values.sum
    end

    def build_population(available:, chosen:)
      1000.times.map { build_at_random(available: available, chosen: chosen) }
    end
  end

  def compatibilities
    pokemons.each_with_object(HashWithIndifferentAccess.new) {|pokemon, hash|
      hash.merge!(pokemon.compatibilities) {|_, v1, v2| v1 + v2 }
    }.map {|k, v| [k, v / pokemons.size] }.to_h.with_indifferent_access
  end
end
