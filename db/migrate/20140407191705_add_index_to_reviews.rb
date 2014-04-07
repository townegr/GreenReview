class AddIndexToReviews < ActiveRecord::Migration
  def change
    add_column :reviews, :user_id, :integer, null: false
    add_index :reviews, :user_id
    add_index :reviews, :product_id
  end
end
