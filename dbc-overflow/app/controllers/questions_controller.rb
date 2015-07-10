# class QuestionsController < ApplicationController

# 	before_action :set_question, only: [:show, :update, :destroy]
#     before_action :allow_cross_domain

# 	# all redirects are taken out, because the controllers only job is to render json or if something doesnt save, render new form

# 	def index
# 		@questions = Question.all 
# 		respond_with @questions
# 	end

# 	def new
# 		@question = Question.new
# 		respond_with @question
# 	end

# 	def show
# 		@question = Question.find(params[:id])
# 		respond_with @question
# 	end

# 	def create
# 		@question = Question.new(question_params)
# 		if @question.save
# 			respond_with @question, status: :created, location: @question
# 		else 
# 			respond_with @question.errors, status: :unprocessable_entity
# 		end
# 	end

# 	def edit
# 	  @question = Question.find(params[:id])
# 	  respond_with @question
# 	end

#    def update
#    	@question = Question.find(params[:id])
#    	if @question.update(question_params)
#    		head :no_content
#    	else
#    		respond_with @question.errors, status: :unprocessable_entity
#    	end
#    end

#    def destroy
#    	@question.destroy
#    end

# 	def upvote
# 	  upvote_question # this method might be done in angular instead of rails, not sure....
# 	end

# 	def downvote
# 		downvote_question
# 	end

# 	private
# 	def upvote_question
#      q = Question.find(params[:id])
#      q.vote_count += 1
#      q.save
#      #redirect_to '/'
#     end

#     def downvote_question
#     	q = Question.find(params[:id])
#     	q.vote_count -= 1
#     	q.save	
#     end

#     def allow_cross_domain
#       headers['Access-Control-Allow-Origin'] = '*'
#       headers['Access-Control-Allow-Methods'] = 'POST, GET, PUT, PATCH, DELETE, OPTIONS'
#       headers['Access-Control-Allow-Headers'] = 'Origin, Content-Type, Accept, Authorization, Token'
#     end
# end

class QuestionsController < ApplicationController
  before_action :set_question, only: [:show, :update, :destroy]
  before_action :allow_cross_domain

  # GET /questions
  # GET /questions.json
  def index
    @questions = Question.all

    render json: @questions
  end

  # GET /questions/1
  # GET /questions/1.json
  def show
    render json: @question
  end

  def new
    @question = Question.new
    render json: @question
  end

  # POST /questions
  # POST /questions.json
  def create
    @question = Question.new(question_params)

    if @question.save
      render json: @question, status: :created, location: @question
    else
      render json: @question.errors, status: :unprocessable_entity
    end
  end

  def edit

  end

  # PATCH/PUT /questions/1
  # PATCH/PUT /questions/1.json
  def update
    @question = Question.find(params[:id])

    if @question.update(question_params)
      head :no_content
    else
      render json: @question.errors, status: :unprocessable_entity
    end
  end

  # DELETE /questions/1
  # DELETE /questions/1.json
  def destroy
    @question.destroy

    head :no_content
  end

  def upvote
    upvote_question # this method might be done in angular instead of rails, not sure....
  end

  def downvote
	downvote_question
  end
  private

    def set_question
      @question = Question.find(params[:id])
    end

    def question_params
      params.require(:question).permit(:title, :content)
    end

    def upvote_question
     q = Question.find(params[:id])
     q.vote_count += 1
     q.save
    end

    def downvote_question
	 q = Question.find(params[:id])
	 q.vote_count -= 1
	 q.save	
    end

    def allow_cross_domain
      headers['Access-Control-Allow-Origin'] = '*'
      headers['Access-Control-Allow-Methods'] = 'POST, GET, PUT, PATCH, DELETE, OPTIONS'
      headers['Access-Control-Allow-Headers'] = 'Origin, Content-Type, Accept, Authorization, Token'
    end
end