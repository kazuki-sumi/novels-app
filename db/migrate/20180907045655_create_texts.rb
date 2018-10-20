class CreateTexts < ActiveRecord::Migration[5.0]
  def change
    create_table :texts do |t|
      t.text :text
      t.references :draft, foreign_key: true
      t.string :subtitle
      t.text :preface
      t.text :postscript

      t.timestamps
    end
  end
end
