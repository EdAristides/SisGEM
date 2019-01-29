class EstoquePecasController < ApplicationController
  load_and_authorize_resource
  before_action :set_estoque_peca, only: [:show, :edit, :update, :destroy]

  # GET /estoque_pecas
  # GET /estoque_pecas.json
  def index
    @estoque_pecas = EstoquePeca.where("status = 'Disponível'").page(params[:page]).per(10)
  end

  def filed
    @estoque_pecas = EstoquePeca.where("status = 'Utilizada'").page(params[:page]).per(10)
  end

  # GET /estoque_pecas/1
  # GET /estoque_pecas/1.json
  def show
  end

  # GET /estoque_pecas/new
  def new
    @estoque_peca = EstoquePeca.new
  end

  # GET /estoque_pecas/1/edit
  def edit
  end

  # POST /estoque_pecas
  # POST /estoque_pecas.json
  def create
    @estoque_peca = EstoquePeca.new(estoque_peca_params)

    respond_to do |format|
      if @estoque_peca.save
        format.html { redirect_to @estoque_peca, notice: 'Estoque peca was successfully created.' }
        format.json { render :show, status: :created, location: @estoque_peca }
      else
        format.html { render :new }
        format.json { render json: @estoque_peca.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /estoque_pecas/1
  # PATCH/PUT /estoque_pecas/1.json
  def update
    respond_to do |format|
      if @estoque_peca.update(estoque_peca_params)
        format.html { redirect_to @estoque_peca, notice: 'Estoque peca was successfully updated.' }
        format.json { render :show, status: :ok, location: @estoque_peca }
      else
        format.html { render :edit }
        format.json { render json: @estoque_peca.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /estoque_pecas/1
  # DELETE /estoque_pecas/1.json
  def destroy
    @estoque_peca.destroy
    respond_to do |format|
      format.html { redirect_to estoque_pecas_url, notice: 'Estoque peca was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_estoque_peca
      @estoque_peca = EstoquePeca.find(params[:id])
    end

    def get_estoque_peca

    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def estoque_peca_params
      params.require(:estoque_peca).permit(:equipamento_id, :peca_id, :quantidade, :status)
    end
end
