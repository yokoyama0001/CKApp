class ApplicationController < ActionController::Base
  protected

  def after_sign_in_path_for(resource)
    sleep(10)
    stored_location_for(resource) || homes_top_path
  end

  before_action :store_user_location!, if: :storable_location?

  private

  def storable_location?
    request.get? && is_navigational_format? && !devise_controller? && !request.xhr?
  end

  def store_user_location!
    store_location_for(:user, request.fullpath)
  end
end
