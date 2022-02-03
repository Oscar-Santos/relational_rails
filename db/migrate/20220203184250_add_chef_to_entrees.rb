class AddChefToEntrees < ActiveRecord::Migration[5.2]
  def change
    add_reference :entrees, :chef, foreign_key: true
  end
end
