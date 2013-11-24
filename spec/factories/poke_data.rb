FactoryGirl.define do
  factory :poke_datum do
    sequence(:poke_id)
    sequence(:name) {|i| "けつばん#{i}" }
    poke_type1 :normal
    poke_type2 nil
    available_in_rating true
    final false
  end
end
