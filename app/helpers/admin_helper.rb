module AdminHelper
  def breadcrumbs links = {}
    crumbs ||= links
    crumbs = '<span>'
    links.each do |title, link|
      crumbs += '<span>'
      crumbs += link_to(title, link)
      crumbs += '</span>'
    end
    crumbs += '</span>'
    content_for(:breadcrumbs, crumbs.html_safe)
    content_for(:breadcrumbs)
  end
end
