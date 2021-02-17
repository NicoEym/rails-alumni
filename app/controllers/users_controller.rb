class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update]
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
    @user.approved = true
    @user.save
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
end
