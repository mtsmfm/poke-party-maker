class TrialParty
  include Virtus.model

  extend ActiveModel::Naming
  include ActiveModel::Conversion
  include ActiveModel::Validations

  attr_reader :party

  attribute :names, Array[String]

  def persisted?
    false
  end

  def save
    if valid?
      persist!
      true
    else
      false
    end
  end

  private

  def persist!
    @party = Party.new

    PokeDatum.where(name: names).each do |poke_datum|
      @party.pokemons << Pokemon.new(poke_datum: poke_datum)
    end

    available = PokeDatum.where.not(name: names).map {|poke_datum|
      Pokemon.new(poke_datum: poke_datum)
    }

    @party.pokemons += PokeComplementer.complement(available: available, chosen: @party.pokemons)

    @party.save
  end
end
