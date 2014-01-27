class TasksController < ApplicationController
	before_action :find_task, only: [:destroy, :edit, :update]

	def index
		@tasks = Task.all
	end

	def new
		@task = Task.new
	end

	def create
		@task = Task.new(task_params)
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

	def destroy
		respond_to do |format|
			if @task.destroy
				format.html { redirect_to tasks_path, notice: "Task was successfully destroyed." }
			else 
				format.html { render action :destroy }
				format.json { render json: @tasks.errors, status: :unprocessable_entity }
			end
		end
	end

	def edit
	end

	def update
		respond_to do |format| 
			if @task.update(task_params) 
				format.html { redirect_to tasks_path, notice: "Task was successfully updated." }
			else
				format.html { render action :update }
				format.json { render json: @tasks.errors, status: :unprocessable_entity }
			end
		end
	end

	private

	def find_task
		@task = Task.find(params[:id])
	end

	def task_params
		params.require(:task).permit(:action)
	end
end
