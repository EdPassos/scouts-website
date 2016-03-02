module ApplicationHelper

  def button_class(ctrls = [], actions = [])
    ctrls.each do |controller|
      if controller.eql? params[:controller]
        if actions.blank?
          return 'active'
        end
        actions.each do |action|
          if action.eql? params[:action]
            return 'active'
          end
        end
      end
    end
    return ''
  end

end
