class QuestionsController < ApplicationController

	before_action :allow_cross_origin

	# all redirects are taken out, because the controllers only job is to render json or if something doesnt save, render new form

	def index
		@questions = Question.all 
		respond_with @questions
	end

	def new
		@question = Question.new
		respond_with @question
	end

	def show
		@question = Question.find(params[:id])
		respond_with @question
	end

	def create
		@question = Question.new(question_params)
		if @question.save
			respond_with @question
		else 
			render 'new'
		end
	end

	def edit
	  @question = Question.find(params[:id])
	  respond_with @question
	end

   def update
    @question = Question.update(question_params)
    respond_with @question
   end

	def upvote
	  upvote_question # this method might be done in angular instead of rails, not sure....
	end

	private
	def upvote_question
     q = Question.find(params[:id])
     q.vote_count += 1
     q.save
     #redirect_to '/'
    end

    def allow_cross_domain
      headers['Access-Control-Allow-Origin'] = '*'
      headers['Access-Control-Allow-Methods'] = 'POST, GET, PUT, PATCH, DELETE, OPTIONS'
      headers['Access-Control-Allow-Headers'] = 'Origin, Content-Type, Accept, Authorization, Token'
    end

end