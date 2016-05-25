class MembersController < ApplicationController
	def index
		if current_member.project_manager?
			@members =  Member.where(role: Member.roles.values-[0,4])
		elsif current_member.team_lead?
			@members =  Member.where(role: Member.roles.values-[0,3,4])
		else current_member.client?		
			@members = Member.where(role: Member.roles.values-[4])
		end
    end

    def show
      @member = Member.find_by_id(params[:id])
    end

    def new
        @member = Member.new
        @members = Member.roles.keys-["admin"]
        if current_member.project_manager?
            @members =  Member.roles.keys-["admin","client","project_manager"]
        elsif current_member.team_lead?
            @members =  Member.roles.keys-["admin","project_manager","client","team_lead"]
        end
    end

    def edit
        @member = Member.find(params[:id])
        @members = Member.where(role: Member.roles.values-[4])
        if current_member.project_manager?
            @members =  Member.where(role: Member.roles.values-[0,4])
        elsif current_member.team_lead?
            @members =  Member.where(role: Member.roles.values-[0,3,4])
        else current_member.client?     
            @members = Member.where(role: Member.roles.values-[4])
        end
    end

    def update
        @member = Member.find(params[:id])
        if @member.update_attributes(member_params)
            redirect_to member_url, notice: "Updated member."
        else
            render :edit
        end
    end

    def update_approve
      @member = Member.find(params[:id]) 
      @member.update_attributes(:approve =>1)
      redirect_to members_path, notice: "User Approved!"
    end

    def destroy
        @member = Member.find(params[:id])
        @member.destroy
        redirect_to  members_path, notice: "User Deleted!!"
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
  params.require(:member).permit(:membername, :username,:email,:approve,:password, :password_confirmation,:role)
end
end

