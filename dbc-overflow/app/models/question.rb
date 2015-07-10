class Question
	belongs_to :user
	has_many :answers

	def score
		#score for question (upvote - downvote or whatever)
	end

end