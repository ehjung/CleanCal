class SchedulesController < ApplicationController
	before_action :find_schedule, only: [:destroy, :edit, :update]
	
	def index
		@schedules = Schedule.all
	end

	def new
		@schedule = Schedule.new
	end

	def create
		@schedule = Schedule.new(schedule_params)

	    respond_to do |format|
	      if @schedule.save
	        format.html { redirect_to roommates_path(scheduleid: @schedule.id) }
	      else
	        format.html { render action: 'new' }
	        format.json { render json: @schedule.errors, status: :unprocessable_entity }
	      end
	    end
	end

	def edit
	end

	def destroy
		roommates = Roommate.where(scheduleid: @schedule.id).all
		tasks = Task.where(scheduleid: @schedule.id).all
		#if !roommates.nil? 
			roommates.each do |roommate|
				if roommate.destroy 
					@notice = "Schedule deleted"
				else
					@warning = "Error while deleting roommate under schedule"
				end
			end
		#end
		
		#if !tasks.nil? 
			tasks.each do |task|
				if task.destroy 
					@notice = "Schedule deleted"
				else
					@warning = "Error while deleting roommate under schedule"
				end
			end
		#end
		respond_to do |format|
			if @schedule.destroy
				format.html { redirect_to schedules_path, notice: @notice, alert: @alert }
				format.json 
			else
				format.html { render action: 'destroy' }
				format.json { render json: @schedule.errors, status: :unprocessable_entity }
			end
		end

	end

	def update
		respond_to do |format|
			if @schedule.update(schedule_params)
				format.html{ redirect_to new_roommates_path }
			else
				format.html { render action: 'update' }
				format.json { render json: @schedule.errors, status: :unprocessable_entity }
			end
		end
	end
	
	private

	def find_schedule
		@schedule = Schedule.find(params[:id])
	end

	def schedule_params
		params.require(:schedule).permit(:title)
	end
end
