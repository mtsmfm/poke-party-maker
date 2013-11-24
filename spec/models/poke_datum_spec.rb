require 'spec_helper'

describe PokeDatum do
  describe '.available_in_rating' do
    faclet!(:available,   :poke_datum, available_in_rating: true)
    faclet!(:unavailable, :poke_datum, available_in_rating: false)

    subject { described_class.available_in_rating }

    it { should eq [available] }
  end

  describe '.final' do
    faclet!(:final,     :poke_datum, final: true)
    faclet!(:not_final, :poke_datum, final: false)

    subject { described_class.final }

    it { should eq [final] }
  end
end
