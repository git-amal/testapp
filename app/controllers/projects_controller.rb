class ProjectsController < ApplicationController
	
	def new
		@project = Project.new
		@members = Member.where(role: Member.roles.values-[0,3])	
	end

	def index
		unless current_member.project_manager?
			@projects = Project.all 
		else
			@projects = Project.where(:member_id=>current_member.id) 
		end
	end

	def create
        @project = current_member.projects.new(project_params)
        @project.member_id = current_member.id
        # hkhukl
        if @project.save
        	
            redirect_to root_path, notice: "Project succesfully created!" 
        else
        	@members = Member.where(role: Member.roles.values-[0,3])
            render :new
        end
    end

    def show
    	@project = Project.find(params[:id])
    	@tasks = @project.tasks
    end

    def edit
    	@project = Project.find(params[:id])
    	@members = Member.where(role: Member.roles.values-[0,3])
    end

    def update
	  @project = Project.find(params[:id])
	  if @project.update(project_params)
	  	redirect_to  projects_path, notice: "Updated Project"
	  else
	  	@members = Member.where(role: Member.roles.values-[0,3])
	    render 'edit'
	  end
	end

	def destroy
		@project = Project.find(params[:id])
		@project.destroy
		redirect_to  projects_path, notice: "Destroyed Project"
	end

    private

	def project_params
	  params.require(:project).permit(:name, :description, :start_date, :end_date,member_ids: [])
	end
end
