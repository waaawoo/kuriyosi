class ChangeDataContentToImte < ActiveRecord::Migration[6.0]
  def change
    change_column :items, :content, :text
  end
end
