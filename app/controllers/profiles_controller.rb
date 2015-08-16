class ProfilesController < ApplicationController
  def show
    @user = User.find(params[:user_id])
    if @user.profile
      @profile = @user.profile
    elsif @user == current_user
      redirect_to "/users/#{current_user.id}/profiles/new"
    else
      redirect_to root_path
    end
  end

  def new
    @user = current_user
    @profile = @user.build_profile
  end

  def create
    @user = current_user
    @profile = current_user.create_profile(profile_params)
    redirect_to user_profile_path(@user)
  end

  # def edit
  #   @user = User.find(params[:user_id])
  #   @profile = Profile.find_by(user_id: params[:user_id])
  # end
  #
  # def update
  #   @user = User.find(params[:user_id])
  #   #@profile = Profile.find_by(user_id: params[:user_id])
  #   @profile= Profile.create(profile_params)
  # end

  private
  def profile_params
    params.require(:profile).permit(:location,:gender,:owned_games, :bio, :img_url)
  end
end
