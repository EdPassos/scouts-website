class AddSectionToTeam < ActiveRecord::Migration
  def change
    add_reference :teams, :section, index: true, foreign_key: true
  end
end
