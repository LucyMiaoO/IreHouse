class AddListingIdToWishlists < ActiveRecord::Migration
  def change
    add_column :wishlists, :listing_id, :integer
  end
end
