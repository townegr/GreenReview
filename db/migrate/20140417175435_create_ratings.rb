class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.integer :user_id,    null:false
      t.integer :product_id, null:false
      t.integer :stars,      null:false

      t.timestamps
    end

    add_index :ratings, [:user_id, :product_id], unique: true
  end
end
