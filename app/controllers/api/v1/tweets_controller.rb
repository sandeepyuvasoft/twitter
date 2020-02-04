class Api::V1::TweetsController < Api::V1::ApiV1BaseController
	before_action :authenticate_user!
	
  def index
    render json: current_user.tweets
  rescue => e
    render json: { status: false, errors: e.message }, status: 403
  end
  
  def all_tweets
    current_user.all_tweets
  end

  def create
    tweet = current_user.my_tweets.create!(content: params.require(:content))
    render json: tweet
  rescue => e
    render json: { status: false, errors: e.message }, status: 403
  end

  def edit
  end

  def show
  end
end
