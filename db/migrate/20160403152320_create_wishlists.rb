class CreateWishlists < ActiveRecord::Migration
  def change
    create_table :wishlists do |t|
      t.integer :rate

      t.timestamps null: false
    end
  end
end
