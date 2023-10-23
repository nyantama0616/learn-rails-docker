class UsersController < ApplicationController
  def create
    user = User.new(user_params)
    if user.save
      render json: {message: "success!", user: user, params: params}
    else
      render json: {message: "failed...!"}
    end
  end

  private

  def user_params
    params.require(:user).permit(:user_id, :password)
  end
end
