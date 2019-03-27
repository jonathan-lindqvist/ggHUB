# frozen_string_literal: true

# Will only fetch the latest players and tournaments
class StartController < ApplicationController
  def index
    @players = User.order('created_at').last(15)
    @articles = Article.last(5)
  end
end
