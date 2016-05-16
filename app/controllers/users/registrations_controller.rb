class Users::RegistrationsController < Devise::RegistrationsController
# before_action :configure_sign_up_params, only: [:create]
before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
  def create
    super
  
    resource.skip_confirmation!
    resource.save!
  end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  def update
  #   super
    account_update_params = devise_parameter_sanitizer.sanitize(:account_update)
    @user = User.find(current_user.id)

    successfully_updated = if account_update_params[:password].blank?
      params[:user].delete(:current_password)
      @user.update_without_password(devise_parameter_sanitizer.sanitize(:account_update))
    else
      @user.update_with_password(devise_parameter_sanitizer.sanitize(:account_update))
    end

    if successfully_updated
      set_flash_message :notice, :updated
      sign_in @user, :bypass => true
      if params[:user][:avatar].present?
        render :crop
      else
        redirect_to root_path
      end
    else
      render :edit
    end
  end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  def configure_account_update_params
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:name, :email, :motto, :self_intro, :blog_title, :avatar, :avatar_crop_x, :avatar_crop_y, :avatar_crop_w, :avatar_crop_h, :password, :password_confirmation, :current_password) }
  end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end

  def send_on_create_confirmation_instructions
  #  send_devise_notification(:confirmation_instructions)
  #  DO NOTHING! REMEMBER TO CHECK THE SOURCE
  end
end
