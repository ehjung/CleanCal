class CalendarsController < ApplicationController


	def index
		@events = Event.where(scheduleid: params[:scheduleid]).all
	end
	
	def create
		@calendar = Calendar.new(calendar_params)
		respond_to do |format|
			if @calendar.save
				format.html { redirect_to calendars_path }
			else
				format.html { render action: 'new' }
	        	format.json { render json: @calendar.errors, status: :unprocessable_entity }
	        end
	    end
	end

	def calendar_params
		params.require(:calendar)#.permit(:title, :start, :end, :scheduleid)
	end
end