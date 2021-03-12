class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.string :content, null: false
      t.string :price, null: false
      t.integer :category_id ,null: false
      t.integer :season_id , null: false
      t.integer :sale_id, null: false
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
