class CreateNovels < ActiveRecord::Migration[5.0]
  def change
    create_table :novels do |t|
      t.text :sentence
      # 外部キー制約
      t.references :user, foreign_key: true
      t.string :title

      t.timestamps
    end
  end
end
