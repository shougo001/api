class MuttersController < ApplicationController
  before_action :set_mutter, only: %i[ show edit update destroy ]

  # GET /mutters or /mutters.json
  def index
    @mutters = Mutter.all.order(id: "DESC")
  end

  def api1
    lists = Mutter.all.order(id: "DESC")
    render json: {data: lists}
  end


  # GET /mutters/1 or /mutters/1.json
  def show
  end

  # GET /mutters/new
  def new
    @mutter = Mutter.new
  end

  # GET /mutters/1/edit
  def edit
  end

  # POST /mutters or /mutters.json
  def create
    @mutter = Mutter.new(mutter_params)
    
    respond_to do |format|
      if @mutter.save
        @mutters = Mutter.all.order(id: "DESC")
        format.html { redirect_to @mutter, notice: "Mutter was successfully created." }
        format.json { render json: @mutters }
        ActionCable.server.broadcast 'mutter_channel', message: 'add'
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @mutter.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /mutters/1 or /mutters/1.json
  def update
    respond_to do |format|
      if @mutter.update(mutter_params)
        format.html { redirect_to @mutter, notice: "Mutter was successfully updated." }
        format.json { render :show, status: :ok, location: @mutter }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @mutter.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mutters/1 or /mutters/1.json
  def destroy
    @mutter.destroy
    respond_to do |format|
      format.html { redirect_to mutters_url, notice: "Mutter was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mutter
      @mutter = Mutter.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def mutter_params
      params.require(:mutter).permit(:message, :name)
    end
end
