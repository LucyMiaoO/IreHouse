class CreateHelpers < ActiveRecord::Migration
  def change
    create_table :helpers do |t|
      t.text :reply

      t.timestamps null: false
    end
  end
end
