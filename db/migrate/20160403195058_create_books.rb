class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :title
      t.string :author
      t.references :borrowed_to, references: :people, index: true

      t.timestamps null: false
    end
  end
end
