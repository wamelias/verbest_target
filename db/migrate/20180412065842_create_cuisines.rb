class CreateCuisines < ActiveRecord::Migration
  def change
    create_table :cuisines do |t|
      t.string :cuisine_name
      t.integer :bookmark_id

      t.timestamps

    end
  end
end
