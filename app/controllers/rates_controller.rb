class RatesController < ApplicationController
  before_action :set_rate, only: %i[show update destroy]

  # GET /rates
  def index
    @rates = Rate.all
    render json: @rates
  end

  # GET /rates/:id
  def show
    render json: @rate
  end

  # POST /rates
  def create
    @rate = Rate.new(rate_params)
    if @rate.save
      render json: @rate, status: :created
    else
      render json: @rate.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /rates/:id
  def update
    if @rate.update(rate_params)
      render json: @rate
    else
      render json: @rate.errors, status: :unprocessable_entity
    end
  end

  # DELETE /rates/:id
  def destroy
    @rate.destroy
    head :no_content
  end

  private

  def set_rate
    @rate = Rate.find(params[:id])
  end

  def rate_params
    params.require(:rate).permit(:star, :comment, :product_id, :user_id)
  end
end
