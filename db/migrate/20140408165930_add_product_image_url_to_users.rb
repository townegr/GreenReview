class AddProductImageUrlToUsers < ActiveRecord::Migration
  def up
    add_column :products, :image, :string
  end

  def down
    remove_column :products, :image
  end
end
