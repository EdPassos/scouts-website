class AddForeignKeyToBooks < ActiveRecord::Migration
  def change
    add_foreign_key :books, :people, column: :borrowed_to_id, primary_key: :person_id
  end
end
