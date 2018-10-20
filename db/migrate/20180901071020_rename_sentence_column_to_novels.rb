class RenameSentenceColumnToNovels < ActiveRecord::Migration[5.0]
  def change
    rename_column :novels, :sentence, :summary
  end
end
