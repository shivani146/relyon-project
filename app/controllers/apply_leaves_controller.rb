class ApplyLeavesController < ApplicationController
  before_action :set_apply_leafe, only: [:show, :edit, :update, :destroy]

  # GET /apply_leaves
  # GET /apply_leaves.json
  def index
  end

  def apply_leave_index
     @employee_details = Employee.find_by(id:params[:id])
  end

  def my_leaves_index
    @all_leaves = Leave.where({employee_id: params[:id]})
    @leave = Leave.where({employee_id: params[:id]}).last ###### For getting latest no.
  end

  def get_leave_details
    details = {}
    details['count'] = LeaveType.find_by(name: params[:leave_name]).count
    render json: details
  end

  def submit_apply_leave
    start_date = Date.today.beginning_of_month
    end_date = Date.today.end_of_month
    payday = Time.days_in_month Date.today.mon
    total_applied_leave = params[:applied_leave].to_i
    weekoff = (start_date..end_date).select{|a| a.cwday > 5 }.count
    leave_employee_id = Leave.where({employee_id: params[:employeeid], name: params[:leave_name]}).first
    if leave_employee_id.present?
      remaining_leaves = leave_employee_id.remaining_leaves - params[:applied_leave].to_i
      payday += remaining_leaves if leave_employee_id.remaining_leaves < 0
      if remaining_leaves < 0 && params[:count].to_i != 0
        render json: { :errors => ["Only #{leave_employee_id.remaining_leaves} is remaining"] }, status: Rack::Utils::SYMBOL_TO_STATUS_CODE[:bad_request]
        return
      end
    else
      # total_lop = params[:applied_leave].to_i if params[:count].to_i == 0
      payday = payday - params[:applied_leave].to_i if params[:count].to_i == 0
      if (params[:applied_leave].to_i > params[:count].to_i)  && params[:count].to_i != 0
        render json: { :errors => ["Applied Leave can't be greater than assigned leaves"] }, status: Rack::Utils::SYMBOL_TO_STATUS_CODE[:bad_request]
        return
      end
      remaining_leaves = params[:count].to_i - params[:applied_leave].to_i
    end
    total_applied_leaves = Leave.where({employee_id: params[:employeeid]}).order(:created_at).reverse_order
    if total_applied_leaves.present?
      Array(total_applied_leaves).each do |applied_leave|
        if params[:count].to_i == 0 && applied_leave.count == 0
          payday += applied_leave.remaining_leaves
         else
          payday = applied_leave.payday
        end
        total_applied_leave += applied_leave.applied_leaves
      end
    end

    present_days = (Time.days_in_month Date.today.mon) - total_applied_leave.to_i - weekoff




    leave = Leave.new({name: params[:leave_name],
                       count: params[:count],
                       applied_leaves: params[:applied_leave],
                       remaining_leaves: remaining_leaves,
                       payday: payday,
                       weekoff: weekoff,
                       total_applied_leaves: total_applied_leave,
                       present_days: present_days,
                       employee_id: params[:employeeid]
                      })
    if leave.save
      render json: leave
    else
      render json: { :errors => ["Something went wrong"] }, status: Rack::Utils::SYMBOL_TO_STATUS_CODE[:bad_request]
      return
    end


  end


  # GET /apply_leaves/1
  # GET /apply_leaves/1.json
  def show
  end

  # GET /apply_leaves/new
  def new
    @apply_leafe = ApplyLeafe.new
  end

  # GET /apply_leaves/1/edit
  def edit
  end

  # POST /apply_leaves
  # POST /apply_leaves.json
  def create
    @apply_leafe = ApplyLeafe.new(apply_leafe_params)

    respond_to do |format|
      if @apply_leafe.save
        format.html { redirect_to @apply_leafe, notice: 'Apply leafe was successfully created.' }
        format.json { render :show, status: :created, location: @apply_leafe }
      else
        format.html { render :new }
        format.json { render json: @apply_leafe.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /apply_leaves/1
  # PATCH/PUT /apply_leaves/1.json
  def update
    respond_to do |format|
      if @apply_leafe.update(apply_leafe_params)
        format.html { redirect_to @apply_leafe, notice: 'Apply leafe was successfully updated.' }
        format.json { render :show, status: :ok, location: @apply_leafe }
      else
        format.html { render :edit }
        format.json { render json: @apply_leafe.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /apply_leaves/1
  # DELETE /apply_leaves/1.json
  def destroy
    @apply_leafe.destroy
    respond_to do |format|
      format.html { redirect_to apply_leaves_url, notice: 'Apply leafe was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_apply_leafe
      @apply_leafe = ApplyLeafe.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def apply_leafe_params
      params.fetch(:apply_leafe, {})
    end
end
