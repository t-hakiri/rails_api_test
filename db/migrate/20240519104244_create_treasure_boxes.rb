class CreateTreasureBoxes < ActiveRecord::Migration[7.0]
  def change
    create_table :treasure_boxes do |t|
      t.references :item_group, null: false, foreign_key: true
      t.timestamps
    end
  end
end
