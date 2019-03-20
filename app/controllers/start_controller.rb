class StartController < ApplicationController
  def index
    @players = User.order("created_at").last(15)
  end
end
