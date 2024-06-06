class CreateReceivedItems < ActiveRecord::Migration[7.0]
  def change
    create_table :received_items do |t|
      t.references :user, null: false, foreign_key: true
      t.string :item_type, null: false
      t.bigint :item_id, null: false

      t.timestamps
    end

    add_index :received_items, [:item_type, :item_id]
  end
end
