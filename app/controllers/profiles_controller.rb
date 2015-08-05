class ProfilesController < ApplicationController
  def show
    @user = User.find_by(id: params[:user_id])
    @profile = @user.profile
  end

  def new
    @user = User.find_by(id: params[:user_id])
    @user.profile.new
  end

  def create
  end
end
