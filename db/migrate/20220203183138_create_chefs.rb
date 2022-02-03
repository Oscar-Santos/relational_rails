class CreateChefs < ActiveRecord::Migration[5.2]
  def change
    create_table :chefs do |t|
      t.string :name
      t.integer :age
      t.boolean :is_male
      t.integer :years_employed
      t.timestamps
    end
  end
end
