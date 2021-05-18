class ProfilesController < ApplicationController
  before_action :authenticate_user!
  before_action :valid_user, only: [:edit,:update,:destroy]
  def new
    @profile = Profile.new
  end

  def create
    @profile = Profile.new(profile_params)
    @profile.user_id = current_user.id
    binding.pry
    if(@profile.save) 
      flash[:success] = "Your Profile is created successfully"
      redirect_to root_path
    else
      render "new"
    end

  end

  def edit
    @profile = Profile.find(params[:id])
    @user = @profile.user
  end

  def update
    @profile = Profile.find(params[:id])
    if @profile.update(profile_params)
      flash[:success] = "Profile is updated successfully"
      redirect_to profile_path(@profile)
    else
      @user = @profile.user
      render 'edit'
      flash[:error] = @profile.errors.full_messages
    end

  end

  def destroy
    @profile = Profile.find(params[:id])
    @profile.destroy
    flash[:danger] = "Profile is deleted successfully"
    redirect_to root_path

  end

  def valid_user
    @profile = Profile.find(params[:id])
    if current_user !=  @profile.user
      flash[:danger]= "You cannot perform this action"
      redirect_to root_path
    end
  end

  def profile_params
    params.require(:profile).permit(:f_name,:l_name,:email,:phone_no,:gender,:Dob_day,:Dob_month,:Dob_year,:qualification,:university,:university_start,:university_end,:university_city,:university_country,:profession,:skills,:about_me,:city,:country,:workplace,:workplace_city,:workplace_country,:interests,:languages,:user_id,:profile_photo,:cover_photo,:photo)
  end

  def show
    @profile = Profile.find(params[:id])
    @user = @profile.user
    @profiles = Profile.all
  end
end