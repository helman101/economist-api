class CreateArticles < ActiveRecord::Migration[6.1]
  def change
    create_table :articles do |t|
      t.string :title
      t.string :img_url
      t.string :url
      t.integer :column_id
      t.integer :priority

      t.timestamps
    end
  end
end
