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
		@score.save
		redirect_to root_path	
  end

  def quote
  	@quotes = Quote.all
  	@quote = @quotes.sample
  	@response = @quote.text
  	puts "*********"
  	puts response
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
