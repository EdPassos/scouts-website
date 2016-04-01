class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  include CanCan::ControllerAdditions

  before_action :metatags

  rescue_from CanCan::AccessDenied, with: :render_not_found

  def metatags
    set_meta_tags og: {
      title:    :title,
      description: 'Acompanhar o percurso de cada um dos escuteiros de Porto Salvo',
      type:     'website',
      url:      root_url,
      image:    view_context.image_url('og-image.png'),
    }
    set_meta_tags description: "Acompanhar o percurso de cada um dos escuteiros de Porto Salvo "
  end

  private
  def render_not_found
    render 'errors/not_allowed'
  end
end
