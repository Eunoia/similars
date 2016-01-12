class AddIndexToSimilars < ActiveRecord::Migration
  def change
  	add_index :similars, [:listing_id, :similar_id], unique: true
  end
end
