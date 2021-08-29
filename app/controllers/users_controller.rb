class UsersController < ApplicationController

  def create
    @user = User.create(user_params)
    if @user.save
      json_response(@user, :created)
    else
      json_response({ errors: @user.errors.full_messages })
    end
  end

  def auth
    user = get_user(user_params)
    if user
      if user.authenticate(params[:password])
        json_response({ id: user.id, name: user.name, email: user.email })
      else json_response({ errors: user.errors.full_messages })
      end
    else json_response({ errors: user.errors.full_messages })
    end
  end

  private

  def user_params
    params.permit(:name, :email, :password, :password_confirmation)
  end

  def get_user(u_params)
    User.find_by(email: u_params[:email])
  end
end
