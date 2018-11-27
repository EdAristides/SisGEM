class ServidorsController < ApplicationController
  before_action :set_servidor, only: [:show, :edit, :update, :destroy]

  # GET /servidors
  # GET /servidors.json
  def index
    # @servidors = Servidor.all
    @servidors = Servidor.search(params[:search]).order(:nome).page(params[:page]).per(10)
  end

  # GET /servidors/1
  # GET /servidors/1.json
  def show
  end

  # GET /servidors/new
  def new
    @servidor = Servidor.new
  end

  # GET /servidors/1/edit
  def edit
  end

  # POST /servidors
  # POST /servidors.json
  def create
    @servidor = Servidor.new(servidor_params)

    respond_to do |format|
      if @servidor.save
        format.html { redirect_to @servidor, notice: 'Servidor was successfully created.' }
        format.json { render :show, status: :created, location: @servidor }
      else
        format.html { render :new }
        format.json { render json: @servidor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /servidors/1
  # PATCH/PUT /servidors/1.json
  def update
    respond_to do |format|
      if @servidor.update(servidor_params)
        format.html { redirect_to @servidor, notice: 'Servidor was successfully updated.' }
        format.json { render :show, status: :ok, location: @servidor }
      else
        format.html { render :edit }
        format.json { render json: @servidor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /servidors/1
  # DELETE /servidors/1.json
  def destroy
    begin
      @servidor.destroy
      # flash[:success] = "successfully destroyed."
      respond_to do |format|
        format.html { redirect_to servidors_url, notice: 'Servidor was successfully destroyed.' }
        format.json { head :no_content }
      end
    rescue ActiveRecord::DeleteRestrictionError => e
      @servidor.errors.add(:base, e)
      # flash[:error] = "#{e}"
      respond_to do |format|
        format.html { redirect_to servidors_url, notice: 'Servidor can not be destroyed. There is some dependency.' }
        format.json { head :no_content }
      end
    end 
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_servidor
      @servidor = Servidor.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def servidor_params
      params.require(:servidor).permit(:siape, :nome, :telefone, :email, :cargo, :status)
    end
end
