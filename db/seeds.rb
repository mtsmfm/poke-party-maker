YAML.load_file(Rails.root.join('config/pokemons.yml')).each do |datum|
  p datum
  poke_datum = PokeDatum.find_or_initialize_by(name: datum[:name])
  type1 = datum[:type1]
  type2 = datum[:type2]
  poke_datum.poke_type1 = type1
  poke_datum.poke_type2 = type2 if type2.present?
  poke_datum.save
end
