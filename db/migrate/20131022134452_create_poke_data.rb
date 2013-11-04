class CreatePokeData < ActiveRecord::Migration
  def change
    create_table :poke_data do |t|
      t.string :name, null: false
      t.string :poke_type1, null: false
      t.string :poke_type2

      t.timestamps
    end
  end
end
