class ApplicationController < ActionController::Base

  before_filter do
    resource = controller_name.singularize.to_sym
    method = "#{resource}_params"
    params[resource] &&= send(method) if respond_to?(method, true)
  end

  protect_from_forgery with: :exception

  def after_sign_in_path_for(resource)
    my_profile_path
  end

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to my_profile_path, :alert => exception.message
  end
end
