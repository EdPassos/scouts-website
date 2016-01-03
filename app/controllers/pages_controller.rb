class PagesController < ApplicationController
  def index
    renderer = Redcarpet::Render::HTML.new(render_options = {})
    @markdown = Redcarpet::Markdown.new(renderer, extensions = {})
	  @posts = Post.order("id desc").limit(3)
  end

  def admin
	  @users = User.all
  end

  def alcateia
  end

  def expedicao
  end

  def comunidade
  end

  def cla
  end

  def history
  end

  def contacts
  end

  def maps
  end

  def calendar
	  @year = params[:year]
	  @month = params[:month]
	  if @year == nil
		  @year = 0.years.ago.year
		  @month = 0.months.ago.month
	  else
		  @year = @year.to_i
		  @month = @month.to_i
	  end
	  date = DateTime.new @year, @month
	  @start = date.beginning_of_month.beginning_of_week
	  @finish = date.end_of_month.end_of_week
	  @events = Event.where(date: @start..@finish)
  end
end
