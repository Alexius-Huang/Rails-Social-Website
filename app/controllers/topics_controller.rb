class TopicsController < ApplicationController
	def create
		@topic = Topic.create(topic_params)

		respond_to do |format|
			format.html { redirect_to root_path }
			format.js
		end
	end

	private

	def topic_params
		params.require(:topic).permit(:title)
	end
end
