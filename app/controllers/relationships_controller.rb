class RelationshipsController < ApplicationController
  def create
    @relationship = Relationship.create(follower_id: params[:user_id], followed_id: login_user.id)
    @relationship.create_activity(user: login_user)
    redirect_back(fallback_location: root_path)
  end

  def destroy
    Relationship.find_by(follower_id: params[:user_id], followed_id: login_user.id).destroy
    redirect_back(fallback_location: root_path)
  end
end
