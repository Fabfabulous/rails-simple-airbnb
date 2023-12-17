class FlatsController < ApplicationController
  before_action :set_flat, only: %i[show edit update destroy]

  def index
    @flats = Flat.all
  end

  def show
  end

  def new
    @flat = Flat.new
  end

  def create
    @flat = Flat.new(flat_params)
    if @flat.save
      redirect_to flat_path(@flat), notice: "Flat correctly created"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @flat.update(flat_params)
      redirect_to flat_path(@flat), notice: "Flat correctly updated!"
    else
      redirect_to root_path, alert: @flat.errors.full_messages.join(", ")
    end
  end

  def destroy
    if @flat.destroy
      redirect_to root_path, notice: "Flat correctly deleted!"
    end
  end

  private

  def set_flat
    @flat = Flat.find(params[:id])
  end

  def flat_params
    params.require(:flat).permit(:name, :description, :address, :price_per_night, :number_of_guests)
  end
end
