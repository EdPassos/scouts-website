class CampNight < ActiveRecord::Base
  belongs_to :adventure
  belongs_to :person
end
