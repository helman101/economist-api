class AddDescriptionToArticles < ActiveRecord::Migration[6.1]
  def change
    add_column :articles, :description, :text
    add_foreign_key :articles, :columns, column: 'column_id'
    add_index :articles, :column_id
  end
end
