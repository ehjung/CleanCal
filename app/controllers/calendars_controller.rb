class CalendarsController < ApplicationController


	def index
		@events = Event.where(scheduleid: params[:scheduleid]).all
	end

=begin
	private

	def find_calendar
		@calendar = Calendar.find(params[:id])
	end

	def calendar_params
		params.require(:calendar).permit(:scheduleid)
	end
=end
end
