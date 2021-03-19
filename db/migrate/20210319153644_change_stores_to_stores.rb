class ChangeStoresToStores < ActiveRecord::Migration[6.0]
  def change
    rename_table :store, :stores
  end
end
