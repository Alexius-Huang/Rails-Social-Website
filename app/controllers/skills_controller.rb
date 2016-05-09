class SkillsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_user

  def create
  	@skill = @user.skills.create(skill_params)

  	respond_to do |format|
  		format.html { redirect_to :back }
  		format.js
  	end
  end

  private

  def find_user
  	@user = User.find(params[:user_id])
  end

  def skill_params
  	params.require(:skill).permit(:title)
  end

end
