class TermoCompromissosController < ApplicationController
  load_and_authorize_resource
  before_action :set_termo_compromisso, only: [:show, :edit, :update, :destroy, :export]
  # Nós incluimos aqui a lib que vamos criar chamada generate_pdf.rb
  require './lib/generate_pdf'

  # GET /termo_compromissos
  # GET /termo_compromissos.json
  def index
    # @termo_compromissos = TermoCompromisso.all
    @termo_compromissos = TermoCompromisso.search(params[:search]).order(:numTermo).page(params[:page]).per(10)
  end

  # GET /termo_compromissos/1
  # GET /termo_compromissos/1.json
  def show
    @comments = @termo_compromisso.comments.order("id DESC").page(params[:page]).per(3)
  end

  # GET /termo_compromissos/new
  def new
    @termo_compromisso = TermoCompromisso.new
  end

  # GET /termo_compromissos/1/edit
  def edit
  end

  # POST /termo_compromissos
  # POST /termo_compromissos.json
  def create
    @termo_compromisso = TermoCompromisso.new(termo_compromisso_params)

    respond_to do |format|
      if @termo_compromisso.save
        TermoCompromisso.update(@termo_compromisso.id, status: "Em uso")
        Equipamento.update(@termo_compromisso.equipamento_id, status: "Vinculado")
        
        format.html { redirect_to @termo_compromisso, notice: 'Termo compromisso was successfully created.' }
        format.json { render :show, status: :created, location: @termo_compromisso }
      else
        format.html { render :new }
        format.json { render json: @termo_compromisso.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /termo_compromissos/1
  # PATCH/PUT /termo_compromissos/1.json
  def update
    respond_to do |format|
      if @termo_compromisso.update(termo_compromisso_params)
        format.html { redirect_to @termo_compromisso, notice: 'Termo compromisso was successfully updated.' }
        format.json { render :show, status: :ok, location: @termo_compromisso }
      else
        format.html { render :edit }
        format.json { render json: @termo_compromisso.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /termo_compromissos/1
  # DELETE /termo_compromissos/1.json
  def destroy
    @termo_compromisso.destroy
    respond_to do |format|
      format.html { redirect_to termo_compromissos_url, notice: 'Termo compromisso was successfully destroyed.' }
      format.json { head :no_content }
      Equipamento.update(@termo_compromisso.equipamento_id, status: "Disponível")
    end
  end

  def export
    GeneratePdf::termo_compromisso(@termo_compromisso.numTermo, @termo_compromisso.equipamento.patrimonio, @termo_compromisso.equipamento.serial, @termo_compromisso.equipamento.modelo.configuracao, @termo_compromisso.equipamento.modelo.valor, @termo_compromisso.servidor.nome, @termo_compromisso.servidor.siape, @termo_compromisso.servidor.telefone, @termo_compromisso.servidor.email, @termo_compromisso.dataVinculo, @termo_compromisso.dataDevolucao)
    redirect_to '/termo_compromisso.pdf'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_termo_compromisso
      @termo_compromisso = TermoCompromisso.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def termo_compromisso_params
      params.require(:termo_compromisso).permit(:numTermo, :equipamento_id, :servidor_id, :dataVinculo, :dataDevolucao)
    end
end
