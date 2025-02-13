class Users::RegistrationsController < Devise::RegistrationsController
  private

  def after_sign_up_path_for(resource)
    if resource.admin?
      admin_dashboard_path  # Redirect admins to the Admin Dashboard
    else
      root_path  # Redirect normal users to the homepage
    end
  end
end
