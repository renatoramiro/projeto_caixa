class RegistrationsController < Devise::RegistrationsController

  protected

    def after_update_path_for(resource)
      information_index_path(resource)
    end

    layout :dashboard
  private
  def dashboard
    if user_signed_in?
      "dashboard"
    else
    	"application"
    end
  end
end