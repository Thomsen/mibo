class TestMongosController < ApplicationController
  before_action :set_test_mongo, only: [:show, :edit, :update, :destroy]

  # GET /test_mongos
  # GET /test_mongos.json
  def index
    @test_mongos = TestMongo.all
  end

  # GET /test_mongos/1
  # GET /test_mongos/1.json
  def show
  end

  # GET /test_mongos/new
  def new
    @test_mongo = TestMongo.new
  end

  # GET /test_mongos/1/edit
  def edit
  end

  # POST /test_mongos
  # POST /test_mongos.json
  def create
    @test_mongo = TestMongo.new(test_mongo_params)

    respond_to do |format|
      if @test_mongo.save
        format.html { redirect_to @test_mongo, notice: 'Test mongo was successfully created.' }
        format.json { render :show, status: :created, location: @test_mongo }
      else
        format.html { render :new }
        format.json { render json: @test_mongo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /test_mongos/1
  # PATCH/PUT /test_mongos/1.json
  def update
    respond_to do |format|
      if @test_mongo.update(test_mongo_params)
        format.html { redirect_to @test_mongo, notice: 'Test mongo was successfully updated.' }
        format.json { render :show, status: :ok, location: @test_mongo }
      else
        format.html { render :edit }
        format.json { render json: @test_mongo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /test_mongos/1
  # DELETE /test_mongos/1.json
  def destroy
    @test_mongo.destroy
    respond_to do |format|
      format.html { redirect_to test_mongos_url, notice: 'Test mongo was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_test_mongo
      @test_mongo = TestMongo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def test_mongo_params
      params.require(:test_mongo).permit(:name)
    end
end
