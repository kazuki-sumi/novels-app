class RenameTexts < ActiveRecord::Migration[5.0]
  def change
    rename_table :texts, :submit_novels
  end
end
