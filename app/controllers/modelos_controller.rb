class ModelosController < ApplicationController
  load_and_authorize_resource
  before_action :set_modelo, only: [:show, :edit, :update, :destroy]

  # GET /modelos
  # GET /modelos.json
  def index
    # @modelos = Modelo.all
    @modelos = Modelo.search(params[:search]).order(:marca).page(params[:page]).per(10)
  end

  # GET /modelos/1
  # GET /modelos/1.json
  def show
    @equipamentos = Equipamento.where(modelo_id: @modelo.id).order(:patrimonio).page(params[:page]).per(10)
    @comments = @modelo.comments.order("id DESC").page(params[:page]).per(3)
  end

  # GET /modelos/new
  def new
    @modelo = Modelo.new
  end

  # GET /modelos/1/edit
  def edit
  end

  # POST /modelos
  # POST /modelos.json
  def create
    @modelo = Modelo.new(modelo_params)

    respond_to do |format|
      if @modelo.save
        format.html { redirect_to @modelo, notice: 'Modelo foi criado com sucesso.' }
        format.json { render :show, status: :created, location: @modelo }
      else
        format.html { render :new }
        format.json { render json: @modelo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /modelos/1
  # PATCH/PUT /modelos/1.json
  def update
    respond_to do |format|
      if @modelo.update(modelo_params)
        format.html { redirect_to @modelo, notice: 'Modelo foi editado com sucesso.' }
        format.json { render :show, status: :ok, location: @modelo }
      else
        format.html { render :edit }
        format.json { render json: @modelo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /modelos/1
  # DELETE /modelos/1.json
  def destroy
    begin
      @modelo.destroy
      # flash[:success] = "successfully destroyed."
      respond_to do |format|
        format.html { redirect_to modelos_url, notice: 'Modelo foi excluído com sucesso.' }
        format.json { head :no_content }
      end
    rescue ActiveRecord::DeleteRestrictionError => e
      @modelo.errors.add(:base, e)
      # flash[:error] = "#{e}"
      respond_to do |format|
        format.html { redirect_to modelos_url, notice: 'Modelo não pode ser destruído. Há alguma dependencia.' }
        format.json { head :no_content }
      end
    end 
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_modelo
      @modelo = Modelo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def modelo_params
      params.require(:modelo).permit(:marca, :configuracao, :valor, :tipo)
    end
end
