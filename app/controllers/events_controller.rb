class EventsController < ApplicationController
	before_action :find_event, only: [:show, :destroy]

	def index
		@events = Event.scoped
		@events = @events.after(params[:start]) if (params[:start])
		@events = @events.before(params[:end]) if (params[:end])

		respond_to do |format|
			format.html
			format.xml { render :xml => @events }
			format.json { render :json => @events }
		end
	end

	def show
		respond_to do |format|
			format.html
			format.xml { render :xml => @event }
			format.json { render :json => @event }
		end
	end

	def new 
		@event = Event.new(scheduleid: params[:scheduleid])

		respond_to do |format|
			format.html
			format.xml { render :xml => @event }
		end
	end

	def create
		@event = Event.new(event_params)

		respond_to do |format|
			if @event.save
				format.html { redirect_to events_path }
			else
				format.html { render action: 'new' }
	        	format.json { render json: @event.errors, status: :unprocessable_entity }
	        end
	    end
	end

	def destroy
		if @event.destroy
			respond_to do |format|
				format.html { redirect_to schedules_path }
				format.xml { head :ok }
			end
		end
	end		

	private

	def find_event
		@event = Event.find(params[:id])
	end

	def event_params
		params.require(:event).permit(:title, :start, :end, :scheduleid)
	end
end
