class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :check_if_complete, only: [:show, :index]

  def index
    @user = current_user
    authorize @user
    @users = policy_scope(User)

    year_param = params[:start_year_prepa]
    sector_param = params[:sector]

    puts year_param.nil?

    @users = @users.where(start_year_prepa: year_param) if !year_param.nil?

    @users = @users.where(sector: sector_param) if !sector_param.nil?

    # if params[:approved] == "false"
    #   @users = User.where(approved: false)
    # else
    #   @users = User.all
    # end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to user_path(@user)
    else
      render :edit
    end
  end


  def destroy
    @user.destroy
    redirect_to users_path

  end


  private

  def set_user
    @user = User.find(params[:id])
    authorize @user
  end

  def check_if_complete
    unless current_user.is_profile_complete? == true
      edit
    end
  end

  def user_params
    params.require(:user).permit(:name, :start_year_prepa, :contact_details, :occupation, :personal_path, :hobbies,
                                  :school_description, :memories, :link_network, :photo)
  end


  def search_params
    params.require(:users).permit(:start_year_prepa, :sector)
  end
end
