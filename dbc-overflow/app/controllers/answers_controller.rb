class AnswersController < ApplicationController

	def new 
		@answer = Answer.new
		respond_with @answer
	end

	def edit
		@answer = Answer.find(params[:id])
		respond_with @answer
	end

	def show
		@answer = Answer.find(params[:id])
		respond_with @answer
	end

	def create
		@answer = Answer.create(answers_params)
		if @answer.save
			respond_with @answer
		else
			render 'new'
		end
	end

	def update
		@answer.update(answers_params)
		respond_with @answer
	end

	def destroy
	end

	def upvote
	end

	private
	def upvote_answer
	end

	def answers_params
     params.require(:answer).permit(:content)
    end

end