class ArticleArchivedState < ActiveRecord::Migration[7.0]
  def change
    add_column :articles, :archived, :boolean, default: false
  end
end
