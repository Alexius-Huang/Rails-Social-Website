class InterestsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_user

  def create
  	@interest = @user.interests.create(interest_params)

  	respond_to do |format|
  		format.html { redirect_to :back }
  		format.js
  	end
  end

  private

  def find_user
  	@user = User.find(params[:user_id])
  end

  def interest_params
  	params.require(:interest).permit(:title)
  end

end
