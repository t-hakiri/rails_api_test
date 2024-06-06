class CreateItemGroupLotteryMachines < ActiveRecord::Migration[7.0]
  def change
    create_table :item_group_lottery_machines do |t|
      t.references :item_group, null: false, foreign_key: true
      t.integer :item_quantity, null: false
      t.string :item_type, null: false
      t.bigint :item_id, null: false
      t.float :weight, null: false

      t.timestamps
    end

    add_index :item_group_lottery_machines, [:item_type, :item_id]
  end
end
