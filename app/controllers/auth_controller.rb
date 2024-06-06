class AuthController < ApplicationController
  skip_before_action :require_login, only: [:create]

  def create
    user = User.find_by(email: params[:email])

    if user.nil?
      render json: { error: "User not found" }, status: :unauthorized
      return
    end

    token = ''
    status = :unauthorized
    if user && user.authenticate(params[:password])
      token = Session.create(user)
      status = :created
    end
    render json: { token: token, user_id: user.id }, status: status
  end

  def logged_in_user
    user = User.find(@session["user_id"])
    render json: { name: user.name, email: user.email }, status: status
  end
end
