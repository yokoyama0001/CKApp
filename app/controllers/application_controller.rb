class ApplicationController < ActionController::Base
  before_action :storre_location

  def storre_location
    if request.get? && is_navigational_format? && !devise_controller? && !request.xhr?
      store_location_for(:user, request.fullpath)
    end
  end

  def after_sign_in_path_for(resource)
    path = stored_location_for(resource) || root_path
    logger.info "after_sign_in_path: #{path}"
    flash[:notice] = "ログインに成功しました。"
    path
  end
end
