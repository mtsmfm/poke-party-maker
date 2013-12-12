FactoryGirl.define do
  factory :pokemon do
    sequence(:pokedex_id)
    sequence(:name) {|i| "けつばん#{i}" }
    type1 :normal
    type2 nil
    available_in_rating true
    final false

    %i(normal ghost).each do |type|
      trait type do
        type1 type
      end
    end
  end
end
