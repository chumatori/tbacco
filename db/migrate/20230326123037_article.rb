class Article < ActiveRecord::Migration[7.0]
  def change
    create_table :articles do |t|
      t.string :header
      t.string :body
      t.integer :like_ids
      t.integer :dislike_ids
      t.references :user, null: false

      t.timestamps
    end
  end
end
