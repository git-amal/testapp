class TasksController < ApplicationController
	def new
		@task = Task.new
		@members = Project.find(params[:project_id]).members
		@project_id	= params[:project_id]
	end

	def create

		@task = Task.new(task_params)
		# ghv
        if @task.save
            redirect_to project_path(@task.project_id), notice: "task succesfully created!" 
        else

			@members = Project.find(params[:task][:project_id]).members
			# render  :action => 'new',:project_id=>params[:task][:project_id]
            redirect_to new_task_path(:project_id=>params[:task][:project_id]), notice: "fields cannot be empty!!"
        end
	end

	def edit
		@task = Task.find_by_id(params[:id])
		@members = Project.find(@task.project_id).members
		
	end

	def update
	  @task = Task.find(params[:id])
	  if @task.update_attributes(task_params)
	  	redirect_to  project_path(@task.project_id), notice: "Updated Task!"
	  else
	  	 redirect_to  edit_task_path(:id=>@task.id), notice: "fields cannot be empty!!"
	  end
	end

	def update_status
	  @task = Task.find(params[:id])
	  status = params[:status]
	  @project = Project.find(@task.project_id)
	  if @task.update_attributes(task_params)
	  	if @project.tasks.count == @project.tasks.where(:status=>2).count
		  @project.update_attributes(:status =>1)
		end
	  	redirect_to  root_path, notice: " Status Updated!"
	  end
	 

	end

	def show
		@task = Task.find(params[:id])
		@username = Member.find(@task.member_id).username
		@project = Project.find(@task.project_id)
	end

	def destroy
		@task = Task.find(params[:id])
		@task.destroy
		redirect_to project_path(@task.project_id), notice: "task succesfully deleted!" 
	end

	private

	def task_params
		params.require(:task).permit(:name,:description,:project_id,:member_id,:status)
	end

end
