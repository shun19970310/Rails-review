class RelationshipsController < ApplicationController
  before_action :authenticate_user!
  # コントローラ作成時に--skip-template-engineを付けることでviewの作成を省略できる
  def create
    following = current_user.relationships.build(follower_id: params[:user_id])
    following.save
    redirect_to request.referrer || root_path
  end

  def destroy
    following = current_user.relationships.find_by(follower_id: params[:user_id])
    following.destroy
    redirect_to request.referrer || root_path
  end
end
