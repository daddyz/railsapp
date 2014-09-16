class HomeController < ApplicationController
  def index
  end

  def profile
    if request.post?
      if current_user.update_attributes permitted_profile_params
        redirect_to edit_profile_path,
                    notice: 'Profile Updated'
      end
    end
  end

  protected

  def permitted_profile_params
    params[:user].permit(:email, :first_name, :last_name, :password,
                         :password_confirmation)
  end
end
