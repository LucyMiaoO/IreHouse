class AddHelpIdToHelper < ActiveRecord::Migration
  def change
    add_column :helpers, :help_id, :integer
  end
end
