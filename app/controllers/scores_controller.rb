class ScoresController < ApplicationController
  before_filter :require_login, except: :create
  # skip_before_filter  :verify_authenticity_token
	protect_from_forgery
	attr_accessor :point, :user_id

  def index
    @users = User.all 
    @scores = Score.all
    @highscores = @scores.order("point DESC").first(10)
    # @lastscores = @user.scores.order("created_at DESC").first(10)
  end

  # def show


  # 	@score = Score.find(params[:id])
  # end

  def new
  	@score = Score.new
  end

  def create
		@score = Score.new(score_params)
		@score.save
		redirect_to root_path	
  end

  def quote
  	@quotes = Quote.all
  	@quote = @quotes.sample
  	@response = @quote.text
  	# puts "*********"
  	# puts response
  	respond_to do |format|
  		format.json {render json: @response}
  		format.html
  	end
  end



  private
  def score_params
  	params.require(:score).permit(:point, :user_id)
  end
end
