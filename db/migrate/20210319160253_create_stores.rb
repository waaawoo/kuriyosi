class CreateStores < ActiveRecord::Migration[6.0]
  def change
    create_table :stores do |t|
      t.string :name, null: false
      t.string :phone, null: false
      t.string :address, null: false
      t.string :open_time, null: false
      t.string :close_time, null: false
      t.integer :holiday_id, null: false
      t.timestamps
    end
  end
end
