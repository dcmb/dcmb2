module DeviseAuth
  def authenticate
    if current_user
      ability = Ability.new(current_user)
      return true if ability.can?(:manage, "Cms::Site")
      raise CanCan::AccessDenied
    else
      scope = Devise::Mapping.find_scope!(:user)
      session["#{scope}_return_to"] = comfy_admin_cms_sites_path
      redirect_to new_user_session_path
    end
  end
end
