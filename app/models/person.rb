class Person < ActiveRecord::Base
  has_and_belongs_to_many :adventures
  belongs_to :caretaker
  belongs_to :user
  belongs_to :section
  belongs_to :team

  has_attached_file :photo, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/escuteiro.jpg"
  validates_attachment_content_type :photo, content_type: /\Aimage\/.*\Z/

  def first_last_name
    "#{first_name} #{last_name}"
  end

  def name(format = :first_last)
    first_last_name
  end

  def age
    today = Date.today
    age = today.year - birthday.year
    if birthday.years_since(age) > today
      age -= 1
    end
    age
  end

end
