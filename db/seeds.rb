YAML.load_file(Rails.root.join('config/pokemons.yml')).each do |datum|
  p datum

  datum[:poke_id] = datum[:id]
  attr_names = %i(name available_in_rating poke_id final)
  poke_datum = PokeDatum.find_or_initialize_by(datum.slice(*attr_names))
  poke_datum.poke_type1, poke_datum.poke_type2 = datum[:types]

  poke_datum.save
end
