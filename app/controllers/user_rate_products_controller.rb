class UserRateProductsController < ApplicationController
  before_action :set_user_rate_product, only: %i[show update destroy]

  # GET /user_rate_products
  def index
    @user_rate_products = UserRateProduct.all
    render json: @user_rate_products
  end

  # GET /user_rate_products/:id
  def show
    render json: @user_rate_product
  end

  # POST /user_rate_products
  def create
    @user_rate_product = UserRateProduct.new(user_rate_product_params)
    if @user_rate_product.save
      render json: @user_rate_product, status: :created
    else
      render json: @user_rate_product.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /user_rate_products/:id
  def update
    if @user_rate_product.update(user_rate_product_params)
      render json: @user_rate_product
    else
      render json: @user_rate_product.errors, status: :unprocessable_entity
    end
  end

  # DELETE /user_rate_products/:id
  def destroy
    @user_rate_product.destroy
    head :no_content
  end

  private

  def set_user_rate_product
    @user_rate_product = UserRateProduct.find(params[:id])
  end

  def user_rate_product_params
    params.require(:user_rate_product).permit(:user_id, :product_id, :rate_id)
  end
end
