class BrandsController < ApplicationController
  def index
    @brands = Brand.all
    render :index
  end
  def new
    @brand = Brand.new
    render :new
  end
  def create
    @brand = Brand.new(brand_params)
    if @brand.save
      redirect_to brands_path
    else
      render :new
    end
  end

  def edit
    @brand = Brand.find(params[:id])
    render :edit
  end
  def show
    @brand = Brand.find(params[:id])
    render :show
  end
  def update
    @brand= Brand.find(params[:id])
    if @brand.update(brand_params)
      redirect_to brands_path
    else
      render :edit
    end
  end

  def destroy
    @brand = Brand.find(params[:id])
    @brand.destroy
    redirect_to brands_path
  end

  private
    def brand_params
      params.require(:brand).permit(:name)
    end
end