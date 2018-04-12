class CreateVenues < ActiveRecord::Migration
  def change
    create_table :venues do |t|
      t.string :venue_address
      t.string :venu_name
      t.string :most_liked_dishes

      t.timestamps

    end
  end
end
