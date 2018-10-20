class AddColumnSequentialId < ActiveRecord::Migration[5.0]
  def change
    add_column :drafts, :sequential_id, :integer, null: false
    add_index :drafts, [:novel_id, :sequential_id], unique: true
  end
end
