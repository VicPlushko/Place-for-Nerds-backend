class Actor < ActiveRecord::Migration[6.0]
  def change
    create_table :actors do |t|
      t.string :name
      t.integer :cast_id
      t.string :profile_path
      t.string :character
      t.integer :movie_id
    end
  end
end
