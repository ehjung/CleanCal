class RoommatesController < ApplicationController

	before_action :find_roommate, only: [:destroy, :edit, :update]
	def index
		@roommates = Roommate.where(scheduleid: params[:scheduleid]).all
	end

	def new
		@roommate = Roommate.new(scheduleid: params[:scheduleid])
	end

	def create
		@roommate = Roommate.new(roommate_params)
	    respond_to do |format|
	      if @roommate.save
	        format.html { redirect_to roommates_path(scheduleid: @roommate.scheduleid)}
	      else
	        format.html { render action: 'new' }
	        format.json { render json: @roommate.errors, status: :unprocessable_entity }
	      end
	    end
	end

	def destroy
		respond_to do |format|
			if @roommate.destroy
				format.html { redirect_to roommates_path, notice: 'Roommate was successfully deleted.' }
			else
				format.html { render action: 'destroy' }
				format.json { render  json: @roommate.errors, status: :unprocessable_entity }
			end
		end
	end

	def edit
	end

	def update
		respond_to do |format|
			if @roommate.update(roommate_params)
				format.html{ redirect_to roommates_path, notice: 'Roommate was successfully updated.' }
			else
				format.html { render action: 'update' }
				format.json { render json: @roommate.errors, status: :unprocessable_entity }
			end
		end
	end

	def show
		redirect_to roommates_path
	end

	private

	def find_roommate
		@roommate = Roommate.find(params[:id])
	end

	def roommate_params
		params.require(:roommate).permit(:name, :scheduleid)
	end
end
