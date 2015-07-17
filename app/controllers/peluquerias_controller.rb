class PeluqueriasController < ApplicationController
  before_action :set_peluqueria, only:[:show]
  def index
  end

  def new
    @peluqueria = Peluqueria.new
  end

  def create
    @peluqueria = Peluqueria.new(peluqueria_params)
    @picture = @peluqueria.picture
    if @peluqueria.save
      redirect_to @peluqueria
      flash[:notice] = "La peluqueria fue creada exitosamente." 
    else
      render 'new'
    end
  end

  def edit
  end

  def update
  end

  def show

  end

  private

  def peluqueria_params
    pictures_attributes = [:id, :caption, :photo]
    params.require(:peluqueria).permit(:name, :phone, :description, :website, :accepts_credit_cards, :parking, pictures_attributes: pictures_attributes)  
  end
  def set_peluqueria 
    @peluqueria = Peluqueria.find(params[:id])
  end

end
