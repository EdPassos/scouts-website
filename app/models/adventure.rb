class Adventure < ActiveRecord::Base
  has_and_belongs_to_many :people
  accepts_nested_attributes_for :people

  has_many :camp_nights

  belongs_to :photo_album
  belongs_to :post

  def nights
    days = (self.end - start).to_i
  end
end
