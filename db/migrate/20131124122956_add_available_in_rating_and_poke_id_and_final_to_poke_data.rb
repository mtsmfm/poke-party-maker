class AddAvailableInRatingAndPokeIdAndFinalToPokeData < ActiveRecord::Migration
  def change
    add_column :poke_data, :available_in_rating, :boolean, null: false
    add_column :poke_data, :poke_id, :integer, null: false
    add_column :poke_data, :final, :boolean, null: false
  end
end
