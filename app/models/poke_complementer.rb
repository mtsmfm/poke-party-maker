module PokeComplementer
  class << self
    def complement(available: , chosen:, random: Random.new)
      @available = available
      @chosen    = chosen
      @random    = random

      population = 1000.times.map { build_candidate }

      population.sort_by {|candidate| judge(candidate + @chosen) }.last
    end

    private

    def comple_size
      6 - @chosen.size
    end

    def build_candidate
      @available.sample(comple_size, random: @random)
    end

    def judge(candidate)
      contributing_hash(candidate).values.sum
    end

    def contributing_hash(candidate)
      TypeChart.list.each_with_object(Hash.new(0)) do |poke_type, hash|
        candidate.each do |pokemon|
          hash[poke_type] += contributing_value(pokemon, poke_type)
        end
      end
    end

    def contributing_value(pokemon, damaged_type)
      rate = TypeChart.rate(damaged_type, pokemon.poke_datum.poke_type1)
      rate *= TypeChart.rate(damaged_type, pokemon.poke_datum.poke_type2) if pokemon.poke_datum.poke_type2.present?

      case rate
      when 0..0.25 then 5
      when 0.5     then 4
      when 1       then 3
      when 2       then 2
      when 4       then 1
      end
    end
  end
end
