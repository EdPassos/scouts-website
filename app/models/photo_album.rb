class PhotoAlbum < ActiveRecord::Base
  has_many :photos, dependent: :destroy

  accepts_nested_attributes_for :photos

  # Validations
  validates :name, presence: true

  def cover
    photo = self.photos.first
    if photo
      photo
    else
      Photo.new
    end
  end

  def date
    date_str = I18n.l self.start.to_date, format: :short_explicit
    if (self.end - self.start > 1.day) or not self.start.day.eql?(self.end.day)
      date_str += "- #{I18n.l self.end.to_date, format: :short_explicit}"
    end
    date_str
  end
end
