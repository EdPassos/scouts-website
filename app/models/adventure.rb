class Adventure < ActiveRecord::Base
  has_and_belongs_to_many :people
  accepts_nested_attributes_for :people

  belongs_to :photo_album
  belongs_to :post
end
