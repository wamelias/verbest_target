class CreateBookmarks < ActiveRecord::Migration
  def change
    create_table :bookmarks do |t|
      t.integer :venue_id
      t.integer :user_id
      t.string :dish_name
      t.string :venue_name

      t.timestamps

    end
  end
end
