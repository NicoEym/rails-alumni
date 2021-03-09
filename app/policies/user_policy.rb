class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(profile: "Alumni")
    end
  end

  def update?
    user_profile_or_user_is_admin?
  end

  def delete?
    user_is_admin?
  end

  def user_profile_or_user_is_admin?
    @user.admin? || @record == @user
  end


  def user_is_admin?
    @user.admin?
  end
end
