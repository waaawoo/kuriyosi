class CreateSalesItems < ActiveRecord::Migration[6.0]
  def change
    create_table :sales_items do |t|
      t.references :item, foreign_key: true
      t.integer :num, null: false
      t.references :sales_price,      null: false, foreign_key: true
      t.timestamps
    end
  end
end
