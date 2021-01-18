class DropActorsTable < ActiveRecord::Migration[6.0]
  def change
    drop_table :actors
  end
end
