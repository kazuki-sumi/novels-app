class CreateNovelTexts < ActiveRecord::Migration[5.0]
  def change
    create_table :novel_texts do |t|
      t.references :novel, foreign_key: true
      t.string :subtitle
      t.text :preface
      t.text :text
      t.text :postscript
      
      t.timestamps
    end
  end
end
