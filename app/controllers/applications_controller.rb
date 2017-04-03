class ApplicationsController < ApplicationController
	before_action :find_application, only: [:show, :edit, :update, :destroy]
	before_action :authenticate_user!

	def index
		@applications = Application.all.order("created_at DESC").limit(3)
	end

<<<<<<< HEAD
	def new	
	  @application = current_user.applications.build
	  @application.tests.build
	end

	def create
		@application = current_user.applications.build(application_params)
=======
	def new
	  @application = Application.new
		@application.questions.build
	end

	def create
		@application = Application.new(application_params)
>>>>>>> 4d10195e1875fbbcfb8f873c9fe4585a654706e6

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
=begin
<div class="field">
	<%= f.label :title %><br>
	<%= f.text_field :name, placeholder: "Name of Your Friend Test", class: "form-control" %><br>
	<%= f.label :description %><br>
	<%= f.text_field :description, placeholder: "Write a witty tagline for your test.", class: "form-control" %><br>
</div>
<h3>Questions</h3>
<div id="questions">
	<ul>
		<%= form_for @question do |f| %>
			<div class="field">
				<%= f.label :question %><br />
				<%= f.text_field :name, placeholder: "Q 4 U" %>
			</div>
		<% end %>
	</ul>
</div>
<div class="form-actions">
	<%= f.submit class: "btn btn-default" %>
</div>
<% end %>
<% end %>

=end
end
