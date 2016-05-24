class InvoicesController < ApplicationController
	def new
		@invoice = Invoice.new
		@project_id	= params[:project_id]
	end

	def index
		if current_member.project_manager?
			@invoices = Invoice.where(:created_by=>current_member.id) 
		else
			@invoices = Invoice.where(:member_id=>current_member.id) 
		end
	end

	def create
        @invoice = Invoice.new(invoice_params)
        @invoice.member_id = params[:invoice][:member_id]
        @invoice.created_by = current_member.id
        if @invoice.save
            redirect_to project_path(@invoice.project_id), notice: "invoice succesfully created!" 
        else
            redirect_to new_invoice_path(:project_id=>params[:invoice][:project_id])
        end
    end

    def show
    	@invoice = Invoice.find(params[:id])
    end

    def edit
        @invoice = Invoice.find(params[:id])
    end

    def update
	  @invoice = Invoice.find(params[:id])
	  if @invoice.update(invoice_params)
	  	redirect_to  invoice_path, notice: "Updated Invoice!!"
	  else
	    render 'edit'
	  end
	end

	def destroy
		@invoice = Invoice.find(params[:id])
		@invoice.destroy
		redirect_to  invoices_path, notice: "Destroyed Invoice!!"
	end

    private

	def invoice_params
	  params.require(:invoice).permit(:name,:member_id, :description,:cost,:project_id,:created_by)
	end
end
