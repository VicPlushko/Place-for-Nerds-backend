class CreateTvShowReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :tv_show_reviews do |t|
      t.string :title
      t.string :content
      t.integer :show_id
      t.integer :user_id

      t.timestamps
    end
  end
end
