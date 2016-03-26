class AddSectionToPerson < ActiveRecord::Migration
  def change
    add_reference :people, :section, index: true, foreign_key: true
  end
end
