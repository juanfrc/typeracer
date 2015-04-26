class PagesController < ApplicationController
  def index
  	@users = User.all 
    @scores = Score.all
    @highscores = @scores.order("point DESC").first(10)
  end

end
