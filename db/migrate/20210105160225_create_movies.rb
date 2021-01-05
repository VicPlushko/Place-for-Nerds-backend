class CreateMovies < ActiveRecord::Migration[6.0]
  def change
    create_table :movies do |t|
      t.string :title
      t.date :release_date
      t.text :synopsis
      t.string :poster
      t.string :actor
      t.string :genre
      t.string :crew

      t.timestamps
    end
  end
end
