YAML.load_file(Rails.root.join('config/pokemons.yml')).each do |datum|
  p datum

  datum[:pokedex_id] = datum[:id]
  attr_names = %i(name available_in_rating pokedex_id final)
  pokemon = Pokemon.find_or_initialize_by(datum.slice(*attr_names))
  pokemon.type1, pokemon.type2 = datum[:types]

  pokemon.save!
end
