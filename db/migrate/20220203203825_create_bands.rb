class CreateBands < ActiveRecord::Migration[5.2]
  def change
    create_table :bands do |t|
      t.string :name
      t.integer :founded
      t.string :genre
      t.boolean :currently_active
      t.timestamps
    end
  end
end
