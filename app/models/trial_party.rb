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

    @party.pokemons << Pokemon.where(name: names)

    available = Pokemon.where.not(name: names).available_in_rating.final

    @party.pokemons += PokeComplementer.complement(available: available, chosen: @party.pokemons)

    @party.save
  end
end
