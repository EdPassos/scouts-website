class Photo < ActiveRecord::Base
  has_attached_file :file,
    styles: { medium: "300x300>", thumb: "100x100>", large: "800x800>" },
    default_url: "/images/:style/missing.png"
  validates_attachment_content_type :file, content_type: /\Aimage\/.*\Z/
  validates :file, attachment_presence: true

  validates :photo_album, presence: true

  belongs_to :photo_album
end
