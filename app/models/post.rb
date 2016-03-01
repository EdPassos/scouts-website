class Post < ActiveRecord::Base
  belongs_to :user
  has_and_belongs_to_many :categories

  accepts_nested_attributes_for :categories

  def to_html(renderer)
    markdown = Redcarpet::Markdown.new(renderer, extensions = {})
    markdown.render(self.body)
  end

  def markdown_to_html(markdown)
    markdown.render(self.body)
  end

end
