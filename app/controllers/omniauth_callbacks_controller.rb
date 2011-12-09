class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  protect_from_forgery :except => [:open_id]
  
  def open_id
    @user = User.find_for_open_id(request.env["omniauth.auth"], current_user)

    if @user.persisted?
      flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => "Yahoo"
      sign_in_and_redirect @user, :event => :authentication
    else
      session["devise.open_id_data"] = request.env["omniauth.auth"]
      redirect_to new_user_registration_url
    end
  end
  
end