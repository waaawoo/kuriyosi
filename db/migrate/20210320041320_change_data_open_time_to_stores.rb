class ChangeDataOpenTimeToStores < ActiveRecord::Migration[6.0]
  def change
    change_column :stores, :open_time, :time
    change_column :stores, :close_time, :time
  end
end
