class SalesController < ApplicationController
  before_action :set_sale, only: %i[show update destroy]

  # GET /sales
  def index
    @sales = Sale.includes(:products).all
    render json: @sales.as_json(include: { sale_products: { include: :product } })
  end

  # GET /sales/:id
  def show
    render json: @sale.as_json(include: { sale_products: { include: :product } })
  end

  # POST /sales
  def create
    @sale = Sale.new(sale_params)
    if @sale.save
      render json: @sale.as_json(include: { sale_products: { include: :product } }), status: :created
    else
      render json: @sale.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /sales/:id
  def update
    if @sale.update(sale_params)
      render json: @sale.as_json(include: { sale_products: { include: :product } })
    else
      render json: @sale.errors, status: :unprocessable_entity
    end
  end

  # DELETE /sales/:id
  def destroy
    @sale.destroy
    head :no_content
  end

  private

  def set_sale
    @sale = Sale.find(params[:id])
  end

  def sale_params
    params.require(:sale).permit(
      :amount,
      :sale_date,
      :user_id,
      sale_products_attributes: %i[product_id quantity rated]
    )
  end
end
