class FixedPagesController < ApplicationController
  def home
    @micropost = current_user.microposts.build if logged_in?
  end

  def help
  end
end
