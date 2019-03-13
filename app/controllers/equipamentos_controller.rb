class EquipamentosController < ApplicationController
  load_and_authorize_resource
  before_action :set_equipamento, only: [:show, :edit, :update, :destroy]

  # GET /equipamentos
  # GET /equipamentos.json
  def index
    # @equipamentos = Equipamento.all
    # @equipamentos = Equipamento.search(params[:search]).page(params[:page]).per(2)
    @equipamentos = Equipamento.search(params[:search]).order(:patrimonio).page(params[:page]).per(10)
  end

  # GET /equipamentos/1
  # GET /equipamentos/1.json
  def show
    @comments = @equipamento.comments.order("id DESC").page(params[:page]).per(3)
  end

  def manutencao
    @equipamento = Equipamento.find(params[:equipamento_id])
    @equipamento_manutencaos = Manutencao.where(["equipamento_id = ?", params[:equipamento_id]]).order(:numOrdem).page(params[:page]).per(10)
  end

  # GET /equipamentos/new
  def new
    @equipamento = Equipamento.new
  end

  # GET /equipamentos/1/edit
  def edit
  end

  # POST /equipamentos
  # POST /equipamentos.json
  def create
    @equipamento = Equipamento.new(equipamento_params)

    respond_to do |format|
      if @equipamento.save
        format.html { redirect_to @equipamento, notice: 'Equipamento foi criado com sucesso.' }
        format.json { render :show, status: :created, location: @equipamento }
      else
        format.html { render :new }
        format.json { render json: @equipamento.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /equipamentos/1
  # PATCH/PUT /equipamentos/1.json
  def update
    respond_to do |format|
      if @equipamento.update(equipamento_params)
        format.html { redirect_to @equipamento, notice: 'Equipamento foi atualizado com sucesso.' }
        format.json { render :show, status: :ok, location: @equipamento }
      else
        format.html { render :edit }
        format.json { render json: @equipamento.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /equipamentos/1
  # DELETE /equipamentos/1.json
  def destroy
    begin
      @equipamento.destroy
      # flash[:success] = "successfully destroyed."
      respond_to do |format|
        format.html { redirect_to equipamentos_url, notice: 'Equipamento foi excluído com sucesso' }
        format.json { head :no_content }
      end
    rescue ActiveRecord::DeleteRestrictionError => e
      @equipamento.errors.add(:base, e)
      # flash[:error] = "#{e}"
      respond_to do |format|
        format.html { redirect_to equipamentos_url, notice: 'Equipamnto não pode ser destruído. Há alguma dependência.' }
        format.json { head :no_content }
      end
    end 
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_equipamento
      @equipamento = Equipamento.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def equipamento_params
      params.require(:equipamento).permit(:id, :patrimonio, :serial, :dataAquisicao, :status, :modelo_id)
    end
end