class ProjectsController < ApplicationController
	
	def new
		@project = Project.new
		@members = Member.all		
	end

	def index
		unless current_user.team_lead?
			@projects = Project.all 
		else
			@projects = Project.where(:user_id=>current_user.id) 
		end
	end

	def create
        @project = current_user.projects.new(project_params)
        # @project.user_id = current_user.id
        # hkhukl
        if @project.save
        	
            redirect_to root_path, notice: "Project succesfully created!" 
        else
        	@users = User.all
            render :new
        end
    end

    def show
    	@project = Project.find(params[:id])
    	@tasks = @project.tasks
    end

    def edit
    	@project = Project.find(params[:id])
    	@users = User.all	
    end

    def update
	  @project = Project.find(params[:id])
	  if @project.update(project_params)
	  	redirect_to  projects_path, notice: "Updated Project"
	  else
	    render 'edit'
	  end
	end


    private

	def project_params
	  params.require(:project).permit(:name, :description, :start_date, :end_date,user_ids: [])
	end
end
