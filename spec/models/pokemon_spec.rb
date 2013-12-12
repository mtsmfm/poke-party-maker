require 'spec_helper'

describe Pokemon do
  describe '.available_in_rating' do
    faclet!(:available,   :pokemon, available_in_rating: true)
    faclet!(:unavailable, :pokemon, available_in_rating: false)

    subject { described_class.available_in_rating }

    it { should eq [available] }
  end

  describe '.final' do
    faclet!(:final,     :pokemon, final: true)
    faclet!(:not_final, :pokemon, final: false)

    subject { described_class.final }

    it { should eq [final] }
  end
end
