class RegistrationsController < Devise::RegistrationsController
	layout 'dashboard'

  protected

    def after_update_path_for(resource)
      information_index_path(resource)
    end
end