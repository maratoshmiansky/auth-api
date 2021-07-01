class UsersController < ApplicationController
  def index
    users = User.all
    # users = current_user.users.all  # this is not working
    render json: users.as_json
  end

  def show
    user = User.find(params[:id])
    # user = current_user.users.find_by(id: params[:id])  # this is not working
    render json: user.as_json
  end

  def create
    user = User.new(
      name: params[:name],
      email: params[:email],
      password: params[:password],
      password_confirmation: params[:password_confirmation],
    )
    if user.save
      render json: { message: "User created successfully" }, status: :created
    else
      render json: { errors: user.errors.full_messages }, status: :bad_request
    end
  end
end
