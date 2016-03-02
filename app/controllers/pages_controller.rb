class PagesController < ApplicationController

  @description = 'ola'

  def index
    @posts = Post.where(draft: false).order("id desc").limit(3)
    render layout: 'homepage'
  end

  def admin
    @users = User.all
  end

  def alcateia
    @header_image = 'http://cdn.bleedingcool.net/wp-content/uploads/2013/12/junglebook2.jpg'
  end

  def expedicao
    @header_image = 'http://www.primeiramao.pt/wordpress/wp-content/uploads/2012/01/escuteiros.jpg'
  end

  def comunidade
    @header_image = 'http://fotos.sapo.pt/pedrooo_3/pic/00007w6s'
  end

  def cla
    @header_image = 'http://agr1100.cne-escutismo.pt/uploads/6/8/5/6/6856085/7237577_orig.jpg'
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
