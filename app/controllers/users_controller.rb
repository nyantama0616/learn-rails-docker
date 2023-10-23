class UsersController < ApplicationController
  before_action :basic_auth, only: [:show, :update, :destroy]

  def index
    users = User.all
    render json: {users: users}
  end

  def show
    render json: {user: @current_user}
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

  def update
    @current_user.update(user_params.slice(:nickname, :comment))
    render json: {user: @current_user}
  end

  def destroy
    @current_user.destroy
    users = User.all
    render json: {users: users}
  end

  private

  def user_params
    params.require(:user).permit(:user_id, :password, :nickname, :comment)
  end

  private

  def basic_auth
    authenticate_or_request_with_http_basic do |user_id, password|
      @current_user = User.find_by(user_id: user_id, password: password)
      !!@current_user
    end
  end
end
