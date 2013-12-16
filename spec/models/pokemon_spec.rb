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

  describe '#compatibilities' do
    let(:pokemon) { create(:pokemon) }

    let(:type) { :ghost }
    let(:defending_ratios) { {type => 0} }
    let(:contribution) { 1.0 }

    before do
      allow(pokemon).to receive(:defending_ratios).and_return(defending_ratios)
      allow(pokemon).to receive(:contribution).and_return(contribution)
    end

    subject { pokemon.compatibilities }

    it { is_expected.to eq(type => contribution) }
  end

  describe '#defending_ratios' do
    let(:type1) { :normal }
    let(:type2) { nil }
    let(:expected_ratio) { Pokemon::TYPES.map {|v| [v, 1.0] }.to_h }

    subject { create(:pokemon, type1: type1, type2: type2).defending_ratios }

    context 'ノーマルタイプのポケモン' do
      let(:type1) { :normal }

      let(:expected_ratio) { super().merge(ghost: 0.0, fighting: 2.0) }

      it { is_expected.to eq expected_ratio }
    end

    context 'ゴースト/あくタイプのポケモン' do
      let(:type1) { :ghost }
      let(:type2) { :dark }

      let(:expected_ratio) {
        super().merge(
          normal: 0.0,
          fighting: 0.0,
          poison: 0.5,
          psychic: 0.0,
          fairy: 2.0
        )
      }

      it { is_expected.to eq expected_ratio }
    end

    context 'フェアリー/はがねタイプのポケモン' do
      let(:type1) { :fairy }
      let(:type2) { :steel }

      let(:expected_ratio) {
        super().merge(
          normal: 0.5,
          fire: 2.0,
          grass: 0.5,
          ice: 0.5,
          poison: 0.0,
          ground: 2.0,
          flying: 0.5,
          psychic: 0.5,
          bug: 0.25,
          rock: 0.5,
          dragon: 0.0,
          dark: 0.5,
          fairy: 0.5
        )
      }

      it { is_expected.to eq expected_ratio }
    end
  end
end
