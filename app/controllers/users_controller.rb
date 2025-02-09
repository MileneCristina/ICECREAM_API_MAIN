class UsersController < ApplicationController
  before_action :set_user, only: %i[show update destroy]

  # GET /users
  def index
    @users = User.includes(:addresses).all
    render json: @users.as_json(include: :addresses)
  end

  # GET /users/:id
  def show
    render json: @user.as_json(include: :addresses)
  end

  # POST /users
  def create
    @user = User.new(user_params)
    if @user.save
      render json: @user.as_json(include: :addresses), status: :created
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users/:id
  def update
    if @user.update(user_params)
      render json: @user.as_json(include: :addresses)
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/:id
  def destroy
    @user.destroy
    head :no_content
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(
      :name,
      :gender,
      :email,
      :password,
      :role,
      addresses_attributes: %i[id street number neighborhood city zip_code _destroy]
    )
  end
end
