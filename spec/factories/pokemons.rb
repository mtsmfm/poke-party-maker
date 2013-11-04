FactoryGirl.define do
  factory :pokemon do
    %i(normal ghost).each do |poke_type|
      trait poke_type do
        poke_datum { build(:poke_datum, poke_type1: poke_type) }
      end
    end
  end
end
