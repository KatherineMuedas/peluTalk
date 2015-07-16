class PeluqueriasController < ApplicationController
  def index
  end

  def new
    @peluqueria = Peluqueria.new
  end

  def create
    @peluqueria = Peluqueria.new(peluqueria_params)
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
    params.require(:shop).permit(:name, :phone, :description, :website, :accepts_credit_cards, :parking)  
  end

end
