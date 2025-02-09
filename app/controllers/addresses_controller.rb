class AddressesController < ApplicationController
  before_action :set_address, only: %i[show update destroy]

  # GET /addresses
  def index
    @addresses = Address.all
    render json: @addresses
  end

  # GET /addresses/:id
  def show
    render json: @address
  end

  # POST /addresses
  def create
    @address = Address.new(address_params)
    if @address.save
      render json: @address, status: :created
    else
      render json: @address.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /addresses/:id
  def update
    if @address.update(address_params)
      render json: @address
    else
      render json: @address.errors, status: :unprocessable_entity
    end
  end

  # DELETE /addresses/:id
  def destroy
    @address.destroy
    head :no_content
  end

  private

  def set_address
    @address = Address.find(params[:id])
  end

  def address_params
    params.require(:address).permit(:street, :number, :neighborhood, :city, :zip_code, :user_id)
  end
end
