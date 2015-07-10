# class AnswersController < ApplicationController
# 	before_action :set_answer, only: [:show, :update, :destroy]


# 	def new 
# 		@answer = Answer.new
# 		respond_with @answer
# 	end

# 	def edit
# 		@answer = Answer.find(params[:id])
# 		respond_with @answer
# 	end

# 	def show
# 		@answer = Answer.find(params[:id])
# 		respond_with @answer
# 	end

# 	def create
# 		@answer = Answer.create(answers_params)
# 		if @answer.save
# 			respond_with @answer
# 		else
# 			render 'new'
# 		end
# 	end

# 	def update
# 		@answer.update(answers_params)
# 		respond_with @answer
# 	end

# 	def destroy
# 	end

# 	def upvote
# 	end

# 	private
# 	def upvote_answer
# 	end

# 	def answers_params
#      params.require(:answer).permit(:content, :)
#     end

# end

class AnswersController < ApplicationController
  before_action :set_answer, only: [:show, :update, :destroy]
  before_action :allow_cross_domain

  # GET /answers
  # GET /answers.json
  def index
    @answers = Answer.all

    render json: @answers
  end

  # GET /answers/1
  # GET /answers/1.json
  def show
    render json: @answer
  end

  def new
    @answer = Answer.new
  end

  # POST /answers
  # POST /answers.json
  def create
    @answer = Answer.new(answer_params)

    if @answer.save
      render json: @answer, status: :created, location: @answer
    else
      render json: @answer.errors, status: :unprocessable_entity
    end
  end

  def edit
  end

  # PATCH/PUT /answers/1
  # PATCH/PUT /answers/1.json
  def update
    @answer = Answer.find(params[:id])

    if @answer.update(answer_params)
      head :no_content
    else
      render json: @answer.errors, status: :unprocessable_entity
    end
  end

  # DELETE /answers/1
  # DELETE /answers/1.json
  def destroy
    @answer.destroy

    head :no_content
  end

  def upvote
  	upvote_answer
  end

  def downvote
  	downvote_answer
  end

  private
    def upvote_answer
    	a = Answer.find(params[:id])
    	a.vote_count += 1
    	a.save
    end

    def downvote_answer
    	a = Answer.find(params[:id])
    	a.vote_count -= 1
    	a.save
    end

    def set_answer
      @answer = Answer.find(params[:id])
    end

    def answer_params
      params.require(:answer).permit(:content, :question_id)
    end

    def allow_cross_domain
      headers['Access-Control-Allow-Origin'] = '*'
      headers['Access-Control-Allow-Methods'] = 'POST, GET, PUT, PATCH, DELETE, OPTIONS'
      headers['Access-Control-Allow-Headers'] = 'Origin, Content-Type, Accept, Authorization, Token'
    end
end