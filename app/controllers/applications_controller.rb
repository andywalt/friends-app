class ApplicationsController < ApplicationController
	before_action :find_application, only: [:show, :edit, :update, :destroy]
	before_action :authenticate_user!, except: [:index, :show]

	def index
		@applications = Application.all.order("created_at DESC").limit(3)
	end

	def new	
	  @application = current_user.applications.build
	  @application.tests.build
	end

	def create
		@application = current_user.applications.build(application_params)

		if @application.save
			redirect_to @application
		else
			render 'new'
		end
	end

	def show
	end

	def edit
	end

	def update
		if @application.update(application_params)
			redirect_to @application
		else
			render 'edit'
		end
	end


	def destroy
		@application.destroy
		redirect_to root_path
	end

	private

	def find_application
		@application = Application.find(params[:id])
	end

	def application_params
		params.require(:application).permit(:name, :description, tests_attributes: [:id, :question, :_destroy])
	end

	def after_sign_out_path_for(resource_or_scope)
	redirect_to root_path
	end
end
