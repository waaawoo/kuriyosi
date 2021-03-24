class CreateSalesPrices < ActiveRecord::Migration[6.0]
  def change
    create_table :sales_prices do |t|
      t.date :day, null: false
      t.integer :price, null: false
      t.timestamps
    end
  end
end
