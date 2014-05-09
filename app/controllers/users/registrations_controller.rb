class Users::RegistrationsController < Devise::RegistrationsController

  before_filter :configure_permitted_parameters, if: :devise_controller?

  # GET /users/sign_up
  def new
    build_resource({})
    resource.schools.build
    respond_with self.resource
  end

  def update
    self.resource = resource_class.to_adapter.get!(send(:"current_#{resource_name}").to_key)
    prev_unconfirmed_email = resource.unconfirmed_email if resource.respond_to?(:unconfirmed_email)

    resource_updated = update_resource(resource, account_update_params)
    yield resource if block_given?
    if resource_updated
      if is_flashing_format?
        flash_key = update_needs_confirmation?(resource, prev_unconfirmed_email) ?
          :update_needs_confirmation : :updated
        set_flash_message :notice, flash_key
      end
      sign_in resource_name, resource, bypass: true
      respond_with resource, location: after_update_path_for(resource)
    else
      clean_up_passwords resource
      respond_with resource
    end
  end

  def destroy
    if resource.friendships
      friends = []
      resource.friendships.each do |friendship|
        friends << friendship.friend
      end
      friends.each do |friend|
        f = Friendship.where(user_id: friend.id, friend_id: resource.id)
        f.first.destroy
      end
    end
    resource.destroy
    Devise.sign_out_all_scopes ? sign_out : sign_out(resource_name)
    set_flash_message :notice, :destroyed if is_flashing_format?
    yield resource if block_given?
    respond_with_navigational(resource){ redirect_to after_sign_out_path_for(resource_name) }
  end

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u|
      u.permit(:first_name, :last_name, :email, :password, :password_confirmation, :avatar, schools_attributes: [:id, :name, :_destroy])
    }
    devise_parameter_sanitizer.for(:account_update) { |u|
      u.permit(:first_name, :last_name, :email, :password, :password_confirmation, :avatar,  :current_password, schools_attributes: [:id, :name, :_destroy] )
    }
  end
end