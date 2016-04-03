class Book < ActiveRecord::Base
  belongs_to :borrowed_to
end
