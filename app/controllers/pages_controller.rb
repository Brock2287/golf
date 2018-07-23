class PagesController < ApplicationController

  respond_to :js, :json, :html
  def about
  end

  def login
  end

  def main
    @courses = Course.all
    @games = Game.all
    @events = Event.all.reverse
    @current_user_hack = current_user
  end

  def userview
    @courses = Course.all
    @games = Game.where(user_id: current_user.id).reverse
    @events = Event.all.reverse
    @current_user_hack = current_user
  end

  def friend
    @user = User.find(params[:user_id])
    @courses = Course.all
    @games = Game.where(user_id: @user.id).reverse
    @events = Event.all.reverse
  end
end
