class PagesController < ApplicationController
  def index
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
  end
end
