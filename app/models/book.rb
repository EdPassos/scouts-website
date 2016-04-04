class Book < ActiveRecord::Base
  belongs_to :borrowed_to

  has_attached_file :cover, styles: { medium: "400x400>", thumb: "100x100>" }, default_url: "/escuteiro.jpg"
  validates_attachment_content_type :cover, content_type: /\Aimage\/.*\Z/
end
