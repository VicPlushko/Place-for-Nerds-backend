class Movies < ActiveRecord::Migration[6.0]
  def change
    create_table :movies do |t|
      t.string :title
      t.string :release_date
      t.text :synopsis
      t.string :poster
      t.integer :actor_id
      t.string :genre
    end
  end
end
