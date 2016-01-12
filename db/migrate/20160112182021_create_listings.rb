class CreateListings < ActiveRecord::Migration
  def change
    create_table :listings do |t|
      t.string :city
      t.string :country
      t.string :property_id
      t.string :name
      t.string :smart_location
      t.string :address
      t.string :zipcode

      t.timestamps null: false
    end
  end
end
