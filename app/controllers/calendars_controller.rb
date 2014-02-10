class CalendarsController < ApplicationController


	def index
		@events = Event.where(scheduleid: params[:scheduleid]).all
	end
	
end
