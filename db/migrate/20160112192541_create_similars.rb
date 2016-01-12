class CreateSimilars < ActiveRecord::Migration
  def change
    create_table :similars do |t|
      t.integer :listing_id
      t.integer :similar_id
      t.integer :rank_raw

      t.timestamps null: false
    end
  end
end
