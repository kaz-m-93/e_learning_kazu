class RelationshipsController < ApplicationController
  def create
    Relationship.create(follower_id: params[:user_id], followed_id: login_user.id)
    # debugger
    redirect_back(fallback_location: root_path)
  end

  def destroy
    Relationship.find_by(follower_id: params[:user_id], followed_id: login_user.id).destroy
    redirect_back(fallback_location: root_path)
  end
end
