class UsersController < ApplicationController
  def index
    users = User.all
    render json: {users: users}
  end

  def create
    user = User.new(user_params)
    if user.save
      render json: {message: "success!", user: user, params: params}
    else
      errors = user.errors.full_messages
      render json: {message: "failed...!", errors: errors}
    end
  end

  private

  def user_params
    params.require(:user).permit(:user_id, :password)
  end
end
