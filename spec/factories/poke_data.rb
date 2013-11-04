FactoryGirl.define do
  factory :poke_datum do
    sequence(:name) {|i| "けつばん#{i}" }
    poke_type1 :normal
    poke_type2 nil
  end
end
