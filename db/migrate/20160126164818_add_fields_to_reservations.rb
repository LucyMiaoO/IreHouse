class AddFieldsToReservations < ActiveRecord::Migration
  def change
    add_column :reservations, :landlord_id, :integer
    add_column :reservations, :student_id, :integer
  end
end
