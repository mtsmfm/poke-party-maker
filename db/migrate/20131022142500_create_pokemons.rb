class CreatePokemons < ActiveRecord::Migration
  def change
    create_table :pokemons do |t|
      t.integer    :pokedex_id,          null: false
      t.string     :name,                null: false
      t.string     :type1,               null: false
      t.string     :type2
      t.boolean    :final,               null: false
      t.boolean    :available_in_rating, null: false

      t.timestamps
    end
  end
end
