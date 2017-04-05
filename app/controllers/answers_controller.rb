class AnswersController < ApplicationController
	def create
		@application = Application.find(params[:application_id])
		@answer = @application.answers.create(params[:answer].permit(:reply))
		@answer.user_id = current_user.id if current_user
		@answer.save

		if @answer.save
			redirect_to application_path(@application)
		else
			render 'applications/new'
		end
	end

end
