class PeluqueriasController < ApplicationController
  before_action :authenticate_user!, only:[:new, :create, :edit, :update, :create_photo]
  before_action :set_peluqueria, only:[:show, :edit, :update, :create_photo]
  def index
  end

  def new
    @peluqueria = Peluqueria.new
  end

  def create
    @peluqueria = Peluqueria.new(peluqueria_params)
    @picture.user_id = current_user.id 
    
    if @peluqueria.save
      redirect_to @peluqueria
      flash[:notice] = "La peluqueria fue creada exitosamente." 
    else
      render 'new'
    end
  end

  def create_photo
    if @peluqueria.update_attributes(pictures_params)
      redirect_to @peluqueria
    else
      redirect_to @peluqueria, notice: "Tu foto no se ha guardado. Intenta otra vez" 
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
    @review = @peluqueria.reviews.new
  end


  private

  def peluqueria_params
    pictures_attributes = [:id, :caption, :photo, :user_id, :peluqueria_id]
    params.require(:peluqueria).permit(:name, :phone, :description, :website, :accepts_credit_cards, :parking, pictures_attributes: pictures_attributes)  
  end
  def pictures_params
    pictures_attributes = [:id, :caption, :photo, :user_id, :peluqueria_id]
    params.require(:peluqueria).permit(pictures_attributes: pictures_attributes)  
  end
  def set_peluqueria 
    @peluqueria = Peluqueria.find(params[:id])
  end

end
