class PhotoAlbum < ActiveRecord::Base
  has_many :photos, dependent: :destroy

  accepts_nested_attributes_for :photos

  def cover
    photo = self.photos.first
    if photo
      photo
    else
      Photo.new
    end
  end
end
