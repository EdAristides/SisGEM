class PecasController < ApplicationController
  load_and_authorize_resource
  before_action :set_peca, only: [:show, :edit, :update, :destroy]

  # GET /pecas
  # GET /pecas.json
  def index
    # @pecas = Peca.all
    @pecas = Peca.search(params[:search]).order(:nome).page(params[:page]).per(3)
  end

  # GET /pecas/1
  # GET /pecas/1.json
  def show
    @comments = @peca.comments.order("id DESC").page(params[:page]).per(3)
  end

  # GET /pecas/new
  def new
    @peca = Peca.new
  end

  # GET /pecas/1/edit
  def edit
  end

  # POST /pecas
  # POST /pecas.json
  def create
    @peca = Peca.new(peca_params)

    respond_to do |format|
      if @peca.save
        format.html { redirect_to @peca, notice: 'Peca was successfully created.' }
        format.json { render :show, status: :created, location: @peca }
      else
        format.html { render :new }
        format.json { render json: @peca.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pecas/1
  # PATCH/PUT /pecas/1.json
  def update
    respond_to do |format|
      if @peca.update(peca_params)
        format.html { redirect_to @peca, notice: 'Peca was successfully updated.' }
        format.json { render :show, status: :ok, location: @peca }
      else
        format.html { render :edit }
        format.json { render json: @peca.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pecas/1
  # DELETE /pecas/1.json
  def destroy
    begin
      @peca.destroy
      # flash[:success] = "successfully destroyed."
      respond_to do |format|
        format.html { redirect_to pecas_url, notice: 'Peca was successfully destroyed.' }
        format.json { head :no_content }
      end
    rescue ActiveRecord::DeleteRestrictionError => e
      @peca.errors.add(:base, e)
      # flash[:error] = "#{e}"
      respond_to do |format|
        format.html { redirect_to pecas_url, notice: 'Peca can not be destroyed. There is some dependency.' }
        format.json { head :no_content }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_peca
      @peca = Peca.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def peca_params
      params.require(:peca).permit(:nome, :caracteristica)
    end
end
