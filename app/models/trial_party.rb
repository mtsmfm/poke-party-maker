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
    chosen = Pokemon.where(name: names)
    available = Pokemon.where.not(name: names).available_in_rating.final

    @party = Party.build_nicely(available: available, chosen: chosen)

    @party.save
  end
end
