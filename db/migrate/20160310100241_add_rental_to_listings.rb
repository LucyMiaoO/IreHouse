class AddRentalToListings < ActiveRecord::Migration
  def change
    add_column :listings, :rental, :decimal
  end
end
