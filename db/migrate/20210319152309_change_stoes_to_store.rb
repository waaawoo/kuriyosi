class ChangeStoesToStore < ActiveRecord::Migration[6.0]
  def change
    rename_table :stores, :store
  end
end
