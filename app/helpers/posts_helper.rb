module PostsHelper
  def safe_markdown(content)
    @markdown ||= Redcarpet::Markdown.new(Redcarpet::Render::HTML, autolink: true, fenced_code_blocks: true, tables: true)
    @markdown.render(content).html_safe
  end 
end
