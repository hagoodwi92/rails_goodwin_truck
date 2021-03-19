class ModelsController < ApplicationController
  def new
    @brand = Brand.find(params[:brand_id])
    @model = @brand.models.new
    render :new
  end
  def create
    @brand = Brand.find(params[:brand_id])
    @model = @brand.models.new(model_params)
    if @model.save
      redirect_to brand_path(@brand)
    else
      render :new
    end
  end
  def show
    @brand = Brand.find(params[:brand_id])
    @model = Model.find(params[:id])
    render :show
  end

  def edit
    @brand = Brand.find(params[:brand_id])
    @model = Model.find(params[:id])
    render :edit
  end
  def update
    @model = Model.find(params[:id])
    if @model.update(model_params)
      redirect_to brand_path(@model.brand)
    else
      @brand = Brand.find(params[:brand_id])
      render :edit
    end
  end

  def destroy
    @model = Model.find(params[:id])
    @model.destroy
    redirect_to brand_path(@model.brand)
  end

  private
    def model_params
      params.require(:model).permit(:name, :year, :price, :miles)
    end
end

