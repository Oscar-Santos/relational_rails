class CreateEntrees < ActiveRecord::Migration[5.2]
  def change
    create_table :entrees do |t|
      t.string :name
      t.boolean :hot_dish
      t.integer :calories
      t.timestamps
    end
  end
end
