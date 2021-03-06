class TablesController < ApplicationController
  before_action :set_table, only: %i[ show edit update destroy ]

  # GET /tables or /tables.json
  def index
    @tables = Table.all
  end

  # GET /tables/1 or /tables/1.json
  def show
    table_id = @table.id
    @items = Item.where(table_id: table_id)
  end

  # GET /tables/new
  def new
    @table = Table.new
    @table.open = true
  end

  # GET /tables/1/edit
  def edit
  end

  # POST /tables or /tables.json
  def create
    @table = Table.new(table_params)
    @table.open = true

    respond_to do |format|
      if @table.save
        format.html { redirect_to @table, notice: "Table was successfully created." }
        format.json { render :show, status: :created, location: @table }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @table.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tables/1 or /tables/1.json
  def update
    puts("Cheguei aqui meu bom = ", @table)
    @table.open = false

    respond_to do |format|
      if @table.save
        format.html { redirect_to @table, notice: "Mesa fechada com sucesso!" }
        format.json { render :show, status: :ok, location: @table }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @table.errors, status: :unprocessable_entity }
      end
    end

    #respond_to do |format|
    #  if @table.update(table_params)
    #    format.html { redirect_to @table, notice: "Table was successfully updated." }
    #    format.json { render :show, status: :ok, location: @table }
    #  else
    #    format.html { render :edit, status: :unprocessable_entity }
    #    format.json { render json: @table.errors, status: :unprocessable_entity }
    #  end
    #end
  end

  # DELETE /tables/1 or /tables/1.json
  def destroy
    @table.destroy
    respond_to do |format|
      format.html { redirect_to tables_url, notice: "Table was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_table
      @table = Table.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def table_params
      params.require(:table).permit(:number, :open)
    end
    def close_table
      @table.open = false
      @table.save
  end
end
