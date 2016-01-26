class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.string :name
      t.string :nationality
      t.integer :age
      t.text :message

      t.timestamps null: false
    end
  end
end
