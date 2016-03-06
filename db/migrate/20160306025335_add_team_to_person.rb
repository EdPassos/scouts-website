class AddTeamToPerson < ActiveRecord::Migration
  def change
    add_reference :people, :team, index: true, foreign_key: true
  end
end
