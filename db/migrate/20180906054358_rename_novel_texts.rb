class RenameNovelTexts < ActiveRecord::Migration[5.0]
  def change
    rename_table :novel_texts, :draft
  end
end
