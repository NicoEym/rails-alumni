class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]
  before_action :check_if_complete, only: [:show, :index]

  def index
    @user = current_user
    authorize @user
    @users = policy_scope(User)
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
end
