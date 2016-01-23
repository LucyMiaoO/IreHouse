class CreateListings < ActiveRecord::Migration
  def change
    create_table :listings do |t|
      t.string :city
      t.decimal :deposit
      t.text :description

      t.timestamps null: false
    end
  end
end
