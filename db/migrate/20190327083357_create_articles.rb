class CreateArticles < ActiveRecord::Migration[5.2]
  def change
    create_table :articles do |t|
      t.string :title
      t.string :content
      t.references :user, foreign_key: true

      t.timestamps
    end
    add_index :articles, [:user_id, :created_at]
  end
end
