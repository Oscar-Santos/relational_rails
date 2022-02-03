class AddBandToMusicians < ActiveRecord::Migration[5.2]
  def change
    add_reference :musicians, :band, foreign_key: true
  end
end
