class CreateCampNights < ActiveRecord::Migration
  def change
    create_table :camp_nights do |t|
      t.references :adventure, index: true, foreign_key: true
      t.references :person, index: true, foreign_key: true
      t.integer :nights

      t.timestamps null: false
    end
  end
end
