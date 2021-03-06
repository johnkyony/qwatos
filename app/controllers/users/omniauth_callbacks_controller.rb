class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    @user = User.from_omniauth(request.env["omniauth.auth"])


    if @user.save
      sign_in @user , :event => :authentication
      redirect_to root_path
      set_flash_message(:notice , :success , :kind => "Facebook") if is_navigational_format?
      
    else
      session["devise.facebook_data"] = request.env["omniauth.auth"]
      redirect_to new_user_registration_url
    end
    
  end
  def twitter
    @user = User.from_omniauth(request.env["omniauth.auth"])
    if @user.save
      sign_in @user , :event => :authentication
      redirect_to root_path
      set_flash_message(:notice , :success , :kind => "Twitter") if is_navigational_format
      
    else
      session["devise.twitter_data"] = request.env["omniauth.auth"]
      redirect_to new_user_registration_url
    end
    
  end
end