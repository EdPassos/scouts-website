class AdventureHasAndBelongsToManyPeople < ActiveRecord::Migration
  def change
    create_table :adventures_people, id: false do |t|
      t.belongs_to :adventure, index: true
      t.belongs_to :person, index: true
    end
  end
end
