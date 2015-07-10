class ApplicationController < ActionController::API
	# so all controllers only render json
	respond_to :json
end
