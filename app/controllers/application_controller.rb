class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  before_action :set_year_list
  before_action :set_sector_list

  def set_year_list
    @years = User.select(:start_year_prepa).map(&:start_year_prepa).uniq
    @years = @years.reject { |item| item.nil? }
    @years =@years.sort.reverse
  end

  def set_sector_list
    @sectors = User.select(:sector).map(&:sector).uniq
    @sectors = @sectors.reject { |item| item.nil? }
    @sectors =@sectors.sort
  end


  include Pundit

  # Pundit: white-list approach.
  after_action :verify_authorized, except: :index, unless: :skip_pundit?
  after_action :verify_policy_scoped, only: :index, unless: :skip_pundit?

  # Uncomment when you *really understand* Pundit!
  # rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  # def user_not_authorized
  #   flash[:alert] = "You are not authorized to perform this action."
  #   redirect_to(root_path)
  # end
  def after_sign_up_path_for(resource)
    "/users/"
    # if current_user.is_profile_complete?
    #   "/users/"# <- Path you want to redirect the user to.
    # else
    #   "/users/edit"
    # end
  end

  def after_sign_in_path_for(resource)
    "/users/"
    # if current_user.is_profile_complete?
    #   "/users/"# <- Path you want to redirect the user to.
    # else
    #   "/users/edit"
    # end
  end

  private

  def skip_pundit?
    devise_controller? || params[:controller] =~ /(^(rails_)?admin)|(^pages$)/
  end

  def default_url_options
    { host: ENV["DOMAIN"] || "localhost:3000" }
  end
end
