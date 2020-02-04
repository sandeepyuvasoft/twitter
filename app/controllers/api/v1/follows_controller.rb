class Api::V1::FollowsController < Api::V1::ApiV1BaseController
  before_action :authenticate_user!

  def create
    current_user.followee_recs.create!(followee_id: params.require(:followee_id))
    head 200
  rescue => e
    render json: {status: false, errors: e.message}, status: 403
  end

  def destroy
    current_user.followee_recs.find_by_followee_id(params.require(:id)).destroy!
    head 200
  rescue => e
    render json: {status: false, errors: e.message}, status: 403
  end
end
