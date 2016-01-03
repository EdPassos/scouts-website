class Post < ActiveRecord::Base
  belongs_to :user

  def to_html(renderer)
    markdown = Redcarpet::Markdown.new(renderer, extensions = {})
    markdown.render(self.body)
  end

  def markdown_to_html(markdown)
    markdown.render(self.body)
  end

end
