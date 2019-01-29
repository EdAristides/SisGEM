class OcorrenciaController < ApplicationController
  load_and_authorize_resource
  before_action :set_ocorrencium, only: [:show, :edit, :update, :destroy]

  # GET /ocorrencia
  # GET /ocorrencia.json
  def index
    @ocorrencia = Ocorrencium.all.order(:termo_compromisso_id).page(params[:page]).per(10)
  end

  # GET /ocorrencia/1
  # GET /ocorrencia/1.json
  def show
  end

  # GET /ocorrencia/new
  def new
    @ocorrencium = Ocorrencium.new
  end

  # GET /ocorrencia/1/edit
  def edit
  end

  # POST /ocorrencia
  # POST /ocorrencia.json
  def create
    @ocorrencium = Ocorrencium.new(ocorrencium_params)

    respond_to do |format|
      if @ocorrencium.save
        format.html { redirect_to @ocorrencium, notice: 'Ocorrencium was successfully created.' }
        format.json { render :show, status: :created, location: @ocorrencium }
      else
        format.html { render :new }
        format.json { render json: @ocorrencium.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ocorrencia/1
  # PATCH/PUT /ocorrencia/1.json
  def update
    respond_to do |format|
      if @ocorrencium.update(ocorrencium_params)
        format.html { redirect_to @ocorrencium, notice: 'Ocorrencium was successfully updated.' }
        format.json { render :show, status: :ok, location: @ocorrencium }
      else
        format.html { render :edit }
        format.json { render json: @ocorrencium.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ocorrencia/1
  # DELETE /ocorrencia/1.json
  def destroy
    @ocorrencium.destroy
    respond_to do |format|
      format.html { redirect_to ocorrencia_url, notice: 'Ocorrencium was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ocorrencium
      @ocorrencium = Ocorrencium.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ocorrencium_params
      params.require(:ocorrencium).permit(:tipo, :dataOcorrencia, :termo_compromisso_id)
    end
end
