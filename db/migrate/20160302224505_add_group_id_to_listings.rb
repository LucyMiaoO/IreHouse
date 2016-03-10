class AddGroupIdToListings < ActiveRecord::Migration
  def change
    add_column :listings, :group_id, :integer
  end
end
