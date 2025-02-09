class SaleProductsController < ApplicationController
  before_action :set_sale_product, only: %i[show update destroy]

  # GET /sale_products
  def index
    @sale_products = SaleProduct.all
    render json: @sale_products
  end

  # GET /sale_products/:id
  def show
    render json: @sale_product
  end

  # POST /sale_products
  def create
    @sale_product = SaleProduct.new(sale_product_params)
    if @sale_product.save
      render json: @sale_product, status: :created
    else
      render json: @sale_product.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /sale_products/:id
  def update
    if @sale_product.update(sale_product_params)
      render json: @sale_product
    else
      render json: @sale_product.errors, status: :unprocessable_entity
    end
  end

  # DELETE /sale_products/:id
  def destroy
    @sale_product.destroy
    head :no_content
  end

  private

  def set_sale_product
    @sale_product = SaleProduct.find(params[:id])
  end

  def sale_product_params
    params.require(:sale_product).permit(:rated, :quantity, :sale_id, :product_id)
  end
end
