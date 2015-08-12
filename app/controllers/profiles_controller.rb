class ProfilesController < ApplicationController
  def show
    @user = User.find(params[:id])
    if @user.profile
      @profile = @user.profile
    else
      redirect_to :action => "new"
    end
  end

  def new
    @user = current_user
    @profile = Profile.new
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
    params.require(:profile).permit(:location,:gender,:owned_games, :bio, :img_url)
  end
end
