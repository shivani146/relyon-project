class SalaryAllotmentsController < ApplicationController
  before_action :set_salary_allotment, only: [:show, :edit, :update, :destroy]

  # GET /salary_allotments
  # GET /salary_allotments.json
  def index
  end

  def create_salary
    @employee_details = Employee.find_by(id:params[:id])
    @salary_heads = SalaryHead.all
  end

  def my_salary
    @salary_allotment = SalaryAllotment.where(employee_id:params[:id]).last
  end

  def calculated_salary
    @employee = Employee.find_by(id:params[:id])
    salary = Salary.find_by(employee_id: params[:id])
    unless salary.present?
      salary = Salary.new
      total_earnings = total_deduction = 0
      if @employee.salary_allotment.present?
        salary_allotment = @employee.salary_allotment.last
        salary_allotment.salary_head_hash.each do |key,value|
          ####### for salary hash ####################################
          if @employee.leave.present?
            calculated_amount = (value.to_i * @employee.leave.last.payday.to_i).fdiv(Time.days_in_month Date.today.mon).round(2)
          else
            calculated_amount = (value.to_i * (Time.days_in_month Date.today.mon)).fdiv(Time.days_in_month Date.today.mon).round(2)
          end

          salary.salary_hash ||= {}
          salary.salary_hash[key] = calculated_amount
          ####### for salary hash ####################################
          ############# For total earning hash #########################
          salary_head = SalaryHead.find(key.to_i)
          if salary_head.earnings == true
            salary.total_earning_hash ||= {}
            total_earnings += calculated_amount
          else
            salary.total_deduction_hash ||= {}
            total_deduction += calculated_amount
          end
          ############# For total earning hash #########################
        end
        salary.total_earning_hash["earning"] = total_earnings
        salary.total_deduction_hash["deduction"] = total_deduction
        salary.net_salary = total_earnings - total_deduction
        salary.employee_id = params[:id]
        salary.save
      end
    end
    respond_to do |format|
      # format.html
      format.pdf do
        render :pdf => "payslip", :template => 'salary_allotments/calculated_salary.html.erb',layout: 'pdf.html'
      end
    end
  end

  # GET /salary_allotments/1
  # GET /salary_allotments/1.json
  def show
  end

  # GET /salary_allotments/new
  def new
    @employee_details = Employee.find_by(id:params[:id])
    @salary_heads = SalaryHead.all
    @salary_allotment = SalaryAllotment.new




    # @salary_allotment[:salary_head_hash] ||= [SalaryAllotment.new]
    # p "#######:#{@salary_allotment}"

  end

  # GET /salary_allotments/1/edit
  def edit
    @employee_details = SalaryAllotment.find_by(id:params[:id]).employee
    @salary_heads = SalaryHead.all
  end

  # POST /salary_allotments
  # POST /salary_allotments.json
  def create
    @salary_allotment = SalaryAllotment.new(salary_allotment_params)
    @salary_allotment.salary_head_hash = params[:salary_allotment][:salary_head_hash]


    respond_to do |format|
      if @salary_allotment.save
        format.html { redirect_to @salary_allotment, notice: 'Salary allotment was successfully created.' }
        format.json { render :show, status: :created, location: @salary_allotment }
      else
        format.html { render :new }
        format.json { render json: @salary_allotment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /salary_allotments/1
  # PATCH/PUT /salary_allotments/1.json
  def update
    respond_to do |format|
      if @salary_allotment.update(salary_allotment_params)
        @salary_allotment.salary_head_hash = params[:salary_allotment][:salary_head_hash]
        format.html { redirect_to @salary_allotment, notice: 'Salary allotment was successfully updated.' }
        format.json { render :show, status: :ok, location: @salary_allotment }
      else
        format.html { render :edit }
        format.json { render json: @salary_allotment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /salary_allotments/1
  # DELETE /salary_allotments/1.json
  def destroy
    @salary_allotment.destroy
    respond_to do |format|
      format.html { redirect_to salary_allotments_url, notice: 'Salary allotment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_salary_allotment
      @salary_allotment = SalaryAllotment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def salary_allotment_params
      params.require(:salary_allotment).permit(:salary_head_id, :employee_id, :amount, :salary_head_hash)
    end
end
