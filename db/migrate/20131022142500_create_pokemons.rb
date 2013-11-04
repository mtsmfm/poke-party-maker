class CreatePokemons < ActiveRecord::Migration
  def change
    create_table :pokemons do |t|
      t.references :poke_datum, index: true
      t.references :party, index: true

      t.timestamps
    end
  end
end
