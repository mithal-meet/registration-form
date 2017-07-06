class LeavesController < ApplicationController
  before_action :set_leave, only: [:show, :edit, :update, :destroy]

  # GET /leaves
  # GET /leaves.json
  def index
    @leaves = Leave.all
  end

  # GET /leaves/1
  # GET /leaves/1.json
  def show
  end

  # GET /leaves/new
  def new
    @leave = Leave.new
  end

  # GET /leaves/1/edit
  def edit
  end
  #new change.....
  def apply_index
    @leaves =Leave.where(:status => false)
    
  end
  def approve_leave
    @leave = Leave.find(params[:id])
    @leave.status = true
    @u = User.find(@leave.user_id)
        @ul = UserLeave.where(:user_id => @u.id, :leave_type => @leave.leave_type)
        @ul1 = @ul[0]
        @ul1.leave_taken = @ul1.leave_taken + @leave.duration
        @ul1.leave_left = @ul1.leave_left - @leave.duration
        @ul1.save
    @leave.save
  end
  # POST /leaves
  # POST /leaves.json
  def create
    #@leave = Leave.new(leave_params)


    @leave = current_user.leaves.create(leave_params) 

    respond_to do |format|
      if @leave.save
         LeaveMailer.welcome_email(@leave).deliver_later
        format.html { redirect_to @leave, notice: 'Leave was successfully applied.' }
        format.json { render :show, status: :created, location: @leave }
      else
        format.html { render :new }
        format.json { render json: @leave.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /leaves/1
  # PATCH/PUT /leaves/1.json
  def update
    respond_to do |format|
      if @leave.update(leave_params)
        format.html { redirect_to @leave, notice: 'Leave was successfully updated.' }
        format.json { render :show, status: :ok, location: @leave }
      else
        format.html { render :edit }
        format.json { render json: @leave.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /leaves/1
  # DELETE /leaves/1.json
  def destroy
    @leave.destroy
    respond_to do |format|
      format.html { redirect_to leaves_url, notice: 'Leave was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_leave
      @leave = Leave.find(params[:id])
      @u = User.find(current_user.id)
      if @leave.user_id != current_user.id && @u.admin == false
        redirect_to leaves_path
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def leave_params
      params.require(:leave).permit(:leave_type, :duration, :user_id)
    end
end
