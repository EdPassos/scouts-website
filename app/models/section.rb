class Section < ActiveRecord::Base
  has_many :teams
  has_many :people
end
