class RenameDraft < ActiveRecord::Migration[5.0]
  def change
    rename_table :draft, :drafts
  end
end
