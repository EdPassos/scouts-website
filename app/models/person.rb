class Person < ActiveRecord::Base
  belongs_to :caretaker
  belongs_to :user
end
