class UsersController < ApplicationController
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
  		@level = "go play to make a score"
  	elsif @average < 40  	 	 
  		@level = "You should play Mario Kart!"
  	elsif @average < 50
  		@level = "Good on your way!"
  	elsif @average < 60 
  		@level = "Congrats you passed Make it Real"
  	elsif @average < 70
  		@level = "You aspiring to become a typist?"
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
    @object  = User.first
    current_user.follow(@object)
    redirect_to 'users/show'
  end

  def unfollow
    @user = User.last # User.find(first)
    puts "This is the first User"
    puts @user
    @object = User.find(params[:id])
    puts "This is the first object"
    puts @object
    @user.stop_following(@object)
    redirect_to 'users/show'
  end

  
end
