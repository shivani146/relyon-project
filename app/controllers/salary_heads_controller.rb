class SalaryHeadsController < ApplicationController
  before_action :set_salary_head, only: [:show, :edit, :update, :destroy]

  # GET /salary_heads
  # GET /salary_heads.json
  def index
    @salary_heads = SalaryHead.all
  end

  # GET /salary_heads/1
  # GET /salary_heads/1.json
  def show
  end

  # GET /salary_heads/new
  def new
    @salary_head = SalaryHead.new
  end

  # GET /salary_heads/1/edit
  def edit
  end

  # POST /salary_heads
  # POST /salary_heads.json
  def create
    @salary_head = SalaryHead.new(salary_head_params)

    respond_to do |format|
      if @salary_head.save
        format.html { redirect_to @salary_head, notice: 'Salary head was successfully created.' }
        format.json { render :show, status: :created, location: @salary_head }
      else
        format.html { render :new }
        format.json { render json: @salary_head.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /salary_heads/1
  # PATCH/PUT /salary_heads/1.json
  def update
    respond_to do |format|
      if @salary_head.update(salary_head_params)
        format.html { redirect_to @salary_head, notice: 'Salary head was successfully updated.' }
        format.json { render :show, status: :ok, location: @salary_head }
      else
        format.html { render :edit }
        format.json { render json: @salary_head.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /salary_heads/1
  # DELETE /salary_heads/1.json
  def destroy
    @salary_head.destroy
    respond_to do |format|
      format.html { redirect_to salary_heads_url, notice: 'Salary head was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_salary_head
      @salary_head = SalaryHead.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def salary_head_params
      params.require(:salary_head).permit(:salaryname, :earnings, :deduction)
    end
end
