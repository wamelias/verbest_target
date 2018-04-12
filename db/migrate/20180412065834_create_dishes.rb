class CreateDishes < ActiveRecord::Migration
  def change
    create_table :dishes do |t|
      t.string :dish_name
      t.integer :cuisine_id
      t.integer :bookmark_id
      t.integer :venue_id

      t.timestamps

    end
  end
end
