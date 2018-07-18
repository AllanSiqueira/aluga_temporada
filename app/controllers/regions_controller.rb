class RegionsController < ApplicationController
  before_action :set_region, only: [:show]

  def index
    @regions = Region.all
  end

  def show
    if @region.properties.blank?
      flash[:notice] = 'Não há imoveis para Copacabana'
    end
  end

  def new
    @region = Region.new
  end

  def create
    @region = Region.new(region_params)
    if @region.save
      flash[:success] = 'Região cadastrada com sucesso'
      redirect_to @region
    else
      flash[:alert] = 'Você deve preencher todos os campos'
      render :new
    end
  end

  private

  def region_params
    params.require(:region).permit(:name)
  end

  def set_region
    @region = Region.find(params[:id])
  end
end
