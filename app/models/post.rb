class Post < ActiveRecord::Base
  belongs_to :user
  alias_attribute :author, :user
  has_and_belongs_to_many :categories

  accepts_nested_attributes_for :categories

  has_attached_file :image, styles: {thumb: "150x150^", large: "1080x1080^", medium: "600x600>" }, default_url: "/escuteiro.jpg"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

  def to_html(renderer)
    markdown = Redcarpet::Markdown.new(renderer, extensions = {})
    markdown.render(self.body)
  end

  def markdown_to_html(markdown)
    markdown.render(self.body)
  end

  def publish(args)
    self.published_at = DateTime.now
    self.draft = false
    args[:draft] = "0"
    self.update args
  end

  # Overrides
  def update(args)
    if self.draft and args[:draft] == "0"
      publish args
    else
      super args
    end
  end

end
