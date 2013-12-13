require 'spec_helper'

describe Party do
  describe '.build_at_random' do
    let(:available) { create_list(:pokemon, 1) }
    let(:chosen)    { create_list(:pokemon, 1) }
    let(:size) { 2 }

    let(:subject_lambda) {
      -> {
        described_class.build_at_random(
          available: available,
          chosen: chosen,
          size: size
        ).pokemons
      }
    }

    subject { subject_lambda.call }

    context '指定した数が利用可能なポケモンの数より多いとき' do
      let(:size) { available.size + chosen.size + 1 }

      subject { subject_lambda }

      it { is_expected.to raise_error(ArgumentError) }
    end

    context '指定した数が指定した全ポケモンの合計数と同じとき' do
      let(:size) { available.size + chosen.size }

      it { is_expected.to eq(chosen + available) }
    end

    context '指定した数が選んだポケモンの数と同じとき' do
      let(:size) { chosen.size }

      it { is_expected.to eq chosen }
    end

    context '指定した数が選んだポケモンの数より多く全ポケモンの合計数より少ないとき' do
      let(:available) { create_list(:pokemon, 2) }
      let(:chosen)    { create_list(:pokemon, 1) }
      let(:size) { 2 }

      before do
        allow(available).to receive(:sample).and_return(available.first(1))
      end

      it { is_expected.to eq chosen + available.first(1) }
    end
  end

  describe '.build_nicely' do
    let(:normals) { build_list(:pokemon, 6, :normal) }
    let(:ghost)   { build(:pokemon, :ghost) }

    let(:normal) { build(:party, pokemons: normals) }
    let(:better) { build(:party, pokemons: normals[0..-2] + [ghost]) }

    let(:chosen)     { normals.first(3) }
    let(:available)  { normals.last(3) + [ghost] }
    let(:population) { [normal, better] }

    before do
      allow(described_class).to receive(:build_population).and_return(population)
    end

    subject(:pokemons) { described_class.build_nicely(available: available, chosen: chosen).pokemons }

    it { expect(pokemons.size).to eq 6 }
    it { is_expected.to include ghost }
  end

  describe '#compatibilities' do
    let(:pokemons) { create_list(:pokemon, 2, :normal) }
    let(:party) { build(:party, pokemons: pokemons) }

    subject { party.compatibilities }

    before do
      pokemons.each {|pkmn| allow(pkmn).to receive(:compatibilities).and_return(normal: 1) }
    end

    it { is_expected.to eq(normal: 2) }
  end
end
