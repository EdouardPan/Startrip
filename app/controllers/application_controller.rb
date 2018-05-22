class ApplicationController < ActionController::Base

  # protect_from_forgery
  # before_action :authenticate_user!

  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!

  include Pundit

  after_action :verify_authorized, except: :index, unless: :skip_pundit?
  after_action :verify_policy_scoped, only: :index, unless: :skip_pundit?

  # Custumize in the controller

  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :human])

    # For additional in app/views/devise/registrations/edit.html.erb
    devise_parameter_sanitizer.permit(:account_update, keys: [:username, :avatar, :human])
  end

  def skip_pundit?
    # Don't touch this. This opens things up when there is no user.
    devise_controller? || params[:controller] =~ /(^(rails_)?admin)|(^pages$)/
  end
end
