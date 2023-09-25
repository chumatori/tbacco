class UpdateArticle < ActiveRecord::Migration[7.0]
  def change
    change_table :articles do |t|
      t.remove :like_ids
      t.remove :dislike_ids
      t.remove :archived
      t.datetime :banned_at
    end
  end
end
