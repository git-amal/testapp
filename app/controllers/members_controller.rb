class MembersController < ApplicationController
		def index
			if current_member.project_manager?
				@members =  Member.where(role: Member.roles.values-[0])
			elsif current_member.team_lead?
				@members =  Member.where(role: Member.roles.values-[0,3])
			else current_member.client?		
				@members = Member.all
			end
    end

    def show
      @member = Member.find_by_id(params[:id])
    end

    def new
        @member = Member.new
    end

    def edit
        @member = Member.find(params[:id])
    end

    def update
        @member = Member.find(params[:id])
        if @member.update_attributes(member_params)
            redirect_to member_url, notice: "Updated member."
        else
            render :edit
        end
    end

    def create
        @member = Member.new(member_params)
        if @member.save
            redirect_to members_path, notice: "member succesfully created!" 
        else
            render :new, notice: "fields cannot be empty!!!" 
        end
    end






private

def member_params
  params.require(:member).permit(:membername, :username,:email, :password, :password_confirmation,:role)
end
end

