class ScoresController < ApplicationController
	protect_from_forgery
	attr_accessor :point, :user_id
  # def index
  # 	@scores = Score.all
  # end

  # def show
  # 	@score = Score.find(params[:id])
  # end

  def new
  	@score = Score.new
  end

  def create
		@score = Score.new(score_params)
		# @score.user_id = 10
		# @score.score = 43
		@score.save
		redirect_to root_path	
		# response = @score
		# head :no_content
  end

  private
  def score_params
  	params.require(:score).permit(:point, :user_id)
  end
end
