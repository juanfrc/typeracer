class UsersController < ApplicationController
  before_filter :require_login
  def index
  	@users = User.all
  	@top_scores = []
  	count = 0
  	@users.each do |user|
  		@max_score = user.scores.order("point DESC").first
  		if @max_score
  			@max_score = @max_score.point
  		end
  		@top_score = {"user_name": user.name, "point": @max_score}
  		puts @top_score
  		@top_scores[count] = @top_score
  		count += 1
  	end
    
  	puts "top scoring scores"
  end

  def show
  	@user = User.find(params[:id])
  	@highscores = @user.scores.order("point DESC").first(10)
  	@lastscores = @user.scores.order("created_at DESC").first(10)
  	@average = @lastscores.collect(&:point).sum.to_f/@lastscores.length if @lastscores.length > 0
  	if @average == nil
  		@level = "Go play to make a score"
  	elsif @average < 40  	 	 
  		@level = "You should go play Mario Kart!"
  	elsif @average < 50
  		@level = "Good on your way!"
  	elsif @average < 60 
  		@level = "Congrats you passed Make it Real"
  	elsif @average < 70
  		@level = "You're aspiring to become a typist?"
  	elsif @average < 80
  		@level = "Your mom is proud!"
  	elsif @average < 90
  		@level = "Want a job as a secretary?"
  	else
  		@level = "Jesus Christ, superstar!"

  	end

  end

  def follow
    # @user = User.find(params[:id])
    #@object  = User.first
    #@object = User.find(2)
    current_user.follow(User.find(params[:format]))
    redirect_to user_path(User.find(params[:format]))

  end

  def unfollow
    puts params 
    puts "********************"
    # if  current_user.following?(User.find(params[:format]))
    current_user.stop_following(User.find(params[:format]))
    # end
    redirect_to user_path(User.find(params[:format]))
  end


private

  def require_login
    unless current_user
      redirect_to root_path
    end
  end

  
end
