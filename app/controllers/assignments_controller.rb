class AssignmentsController < ApplicationController
  def new
    @assignment = Assignment.new
  end

  def create
    @assignment = Assignment.new(assignment_params)
    if @assignment.save
      redirect_to new_assignment_path
      flash[:success] = "Assignment created"
      User.find_each do |user|
        UserMailer.new_assignment(user, @assignment).deliver
        user.send_sms("Hello #{user.name}, an assignment has been availed. Please check your dashboard and do it to avoid penalties")
      end
      # @user = User.find_by(id: params[:id])
    else
      render 'new'
    end
  end

  def show
    @assignment = Assignment.find(params[:id])
  end

  def index
    @assignments = Assignment.all
  end

  def destroy
    Assignment.find(params[:id]).destroy
    flash[:success] ="assignment  deleted"
    redirect_to assignments_url
  end

  private

  def assignment_params
    params.require(:assignment).permit(:title, :description, :link, :start_date, :due_date)
  end
end
