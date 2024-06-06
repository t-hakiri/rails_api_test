class CreateWeaponItems < ActiveRecord::Migration[7.0]
  def change
    create_table :weapon_items do |t|
      t.string :name, null: false
      t.integer :kind, null: false

      t.timestamps
    end
  end
end
