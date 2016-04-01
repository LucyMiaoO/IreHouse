class CreateHelps < ActiveRecord::Migration
  def change
    create_table :helps do |t|
      t.string :title
      t.string :city
      t.text :message

      t.timestamps null: false
    end
  end
end
