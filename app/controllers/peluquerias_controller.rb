class PeluqueriasController < ApplicationController
  # before_action :authenticate_user!, only:[:new, :create, :edit, :update]
  before_action :set_peluqueria, only:[:show, :edit, :update]
  def index
  end

  def new
    @peluqueria = Peluqueria.new
  end

  def create
    @peluqueria = Peluqueria.new(peluqueria_params)
    # @picture = @peluqueria.picture
    # @picture.user = current_user
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
    if @peluqueria.update_attributes(peluqueria_params)
        redirect_to @peluqueria
    else
      render 'edit'
    end
  end

  def show
    @pictures = @peluqueria.pictures.all.order(created_at: :desc)
  end


  private

  def peluqueria_params
    pictures_attributes = [:id, :caption, :photo, :user_id]
    params.require(:peluqueria).permit(:name, :phone, :description, :website, :accepts_credit_cards, :parking, pictures_attributes: pictures_attributes)  
  end
  def set_peluqueria 
    @peluqueria = Peluqueria.find(params[:id])
  end

end
