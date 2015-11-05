class EventsController < ApplicationController
	def index
	end

	def show
	end

	def new
		@event = Event.new
	end

	def create
		@event = Event.new(event_params)
		@event.save
		redirect_to calendar_path
	end

	def edit
	end

	def update
	end

	def destroy
	end

	private
	def event_params
		params.require(:event).permit(:title, :description, :date)
	end
end
