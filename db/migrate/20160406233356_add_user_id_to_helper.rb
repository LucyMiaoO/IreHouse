class AddUserIdToHelper < ActiveRecord::Migration
  def change
    add_column :helpers, :user_id, :integer
  end
end
