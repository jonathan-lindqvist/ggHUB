# frozen_string_literal: true

# useless
class LearnsController < ApplicationController
  before_action :set_learn, only: %i[show edit update destroy]

  # GET /learns
  # GET /learns.json
  def index
    @learns = Learn.all
  end

  # GET /learns/1
  # GET /learns/1.json
  def show; end

  # GET /learns/new
  def new
    @learn = Learn.new
  end

  # GET /learns/1/edit
  def edit; end

  # POST /learns
  # POST /learns.json
  def create
    @learn = Learn.new(learn_params)

    respond_to do |format|
      if @learn.save
        format.html { redirect_to @learn, notice: 'Learn was successfully created.' }
        format.json { render :show, status: :created, location: @learn }
      else
        format.html { render :new }
        format.json { render json: @learn.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /learns/1
  # PATCH/PUT /learns/1.json
  def update
    respond_to do |format|
      if @learn.update(learn_params)
        format.html { redirect_to @learn, notice: 'Learn was successfully updated.' }
        format.json { render :show, status: :ok, location: @learn }
      else
        format.html { render :edit }
        format.json { render json: @learn.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /learns/1
  # DELETE /learns/1.json
  def destroy
    @learn.destroy
    respond_to do |format|
      format.html { redirect_to learns_url, notice: 'Learn was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_learn
    @learn = Learn.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def learn_params
    params.require(:learn).permit(:wow)
  end
end
