class ProfilesController < ApplicationController
  def show
    @user = User.find_by(id: params[:user_id])
    @profile = Profile.find_by(user_id: params[:user_id])
  end

  def new
    @user = current_user
    if !@user.profile
      @profile = Profile.new
    else
      @profile = Profile.find_by(user_id: params[:user_id])
    end
  end

  def create
    @user = current_user
    @profile = Profile.create(profile_params)
    @profile.user = current_user
    @profile.save
  end

  def edit
    @user = User.find(params[:user_id])
    @profile = Profile.find_by(user_id: params[:user_id])
  end

  def update
    @user = User.find(params[:user_id])
    #@profile = Profile.find_by(user_id: params[:user_id])
    @profile= Profile.create(profile_params)
  end

  private
  def profile_params
    params.require(:profile).permit(:location,:gender,:owned_games, :bio, :img_url, :user_id)
  end
end
