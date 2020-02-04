class Api::V1::UsersController < Api::V1::ApiV1BaseController
  before_action :authenticate_user!

  def show
    user = User.find(params.require(:id))
    render json: user.as_json(include: [
      :followers, :followees
    ])
  rescue => e
    render json: { status: false, errors: e.message }, status: 403    
  end

  def tweets
    render json: current_user.my_tweets
  rescue => e
    render json: { status: false, errors: e.message }, status: 403
  end

  def profile
    render json: current_user.as_json(include: [
      :followers, :followees
    ])
  rescue => e
    render json: { status: false, errors: e.message }, status: 403
  end

  def followers
    render json: { followers: current_user.followers }
  rescue => e
    render json: { status: false, errors: e.message }, status: 403
  end

  def followees
    render json: { followees: current_user.followees }
  rescue => e
    render json: { status: false, errors: e.message }, status: 403
  end
end
