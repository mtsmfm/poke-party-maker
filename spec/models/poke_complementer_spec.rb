require 'spec_helper'

describe PokeComplementer do
  describe '.complement' do
    let(:chosen)    { build_list(:pokemon, 3, :normal) }
    let(:ghost)     { create(:pokemon, :ghost) }
    let(:available) { build_list(:pokemon, 3, :normal) + [ghost] }

    subject { described_class.complement(available: available, chosen: chosen) }

    its(:size) { should eq 3 }
    it { should include ghost }
  end
end
