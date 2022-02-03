class CreateMusician < ActiveRecord::Migration[5.2]
  def change
    create_table :musicians do |t|
      t.string :name
      t.string :instrument
      t.boolean :founding_member
      t.integer :born
      t.timestamps
    end
  end
end
