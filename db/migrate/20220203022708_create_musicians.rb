class CreateMusicians < ActiveRecord::Migration[5.2]
  def change
    create_table :musicians do |t|
      t.integer :band_id
      t.string :name
      t.string :instrument
      t.boolean :founding_member
      t.numeric :born
      t.timestamps
    end
  end
end
