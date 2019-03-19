class StartController < ApplicationController
  def index
    @players = User.order("created_at").last(15)
    if logged_in?
      @micropost  = current_user.microposts.build
      @feed_items = current_user.feed.paginate(page: params[:page])
    end
  end
end
