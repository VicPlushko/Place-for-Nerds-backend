class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.textarea :content
      t.integer :movie_id

      t.timestamps
    end
  end
end
