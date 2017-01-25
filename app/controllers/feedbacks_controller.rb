class FeedbacksController < ApplicationController
  before_action :logged_in_user
  def new
    @feedback = Feedback.new
  end
end
