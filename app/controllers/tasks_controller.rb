class TasksController < ApplicationController
	before_action :find_task, only: []

	def index
		@tasks = Task.all
	end

	def new
		@task = Task.new
	end

	def create
		@task = Task.new
		respond_to do |format|
			if @task.save
				format.html { redirect_to tasks_path, notice: "Task was successfully created." }
			else 
				format.html { render action :new }
				format.json { render json: @tasks.errors, status: :unprocessable_entity }
			end
		end
	end

	def show
		redirect_to tasks_path
	end

	def find_task
		@task = Task.find(params[:id])
	end
end
