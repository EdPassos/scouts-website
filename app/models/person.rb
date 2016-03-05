class Person < ActiveRecord::Base
  belongs_to :caretaker
  belongs_to :user
  belongs_to :section

  has_attached_file :photo, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/escuteiro.jpg"
  validates_attachment_content_type :photo, content_type: /\Aimage\/.*\Z/

  def first_last_name
    "#{first_name} #{last_name}"
  end

  def name(format = :first_last)
    first_last_name
  end

end
