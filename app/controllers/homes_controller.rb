class HomesController < ApplicationController
  def index
    @user = User.last
  end
end
