class UsersController < ApplicationController
  def create
    @user = User.create!(user_params)
    json_response(@user, :created)
  end

  def auth
    user = get_user(user_params)
    if user
      if user.authenticate(params[:password])
        json_response({ id: user.id, name: user.name, email: user.email })
      else json_response({ error: ['Wrong password'] })
      end
    else json_response({ errors: ['This user does not exist'] })
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
