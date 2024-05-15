class ApplicationController < ActionController::Base
  protected

  def after_sign_in_path_for(resource)
    path = stored_location_for(resource) || root_path
    logger.info "after_sign_in_path: #{path}"
    flash[:notice] = "ログインに成功しました。"
    path
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
