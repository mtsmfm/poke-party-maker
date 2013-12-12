class CreatePartiesPokemons < ActiveRecord::Migration
  def change
    create_table :parties_pokemons do |t|
      t.references :party,   index: true
      t.references :pokemon, index: true
    end
  end
end
