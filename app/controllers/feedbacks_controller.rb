class FeedbacksController < ApplicationController
  before_action :logged_in_user

  def new
    @feedback = Feedback.new
  end


  def create
    @feedback = Feedback.new(feedback_params)
    if @feedback.save
      redirect_to user
      flash[:success] = "Thanks for your feedback"
    else
      flash[:alert] = "There was a problem sending feedback"
      render 'new'
    end
  end

  def index
    @feedbacks = current_user.feedbacks.all
  end

  private
  def feedback_params
    params.require(:feedback).permit(:learnt, :problem, :user_id, :possible_fix)
  end
end
