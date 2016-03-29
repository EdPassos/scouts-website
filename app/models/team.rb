class Team < ActiveRecord::Base
  belongs_to :section
  has_many :people

  # Validations
  validates :name, :section_id, :presence => true
end
