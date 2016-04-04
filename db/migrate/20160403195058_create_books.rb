class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :title
      t.string :author
      t.references :borrowed_to, references: :people, index: true, foreign_key: :person_id

      t.timestamps null: false
    end
  end
end
