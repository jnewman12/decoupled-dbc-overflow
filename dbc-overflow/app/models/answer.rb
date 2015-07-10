class Answer
	belongs_to :user
	belongs_to :question

	def score
		# score for answer (upvote - downvote or whatever)
	end
end