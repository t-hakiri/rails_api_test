class CreateItemGroups < ActiveRecord::Migration[7.0]
  def change
    create_table :item_groups do |t|

      t.timestamps
    end
  end
end
