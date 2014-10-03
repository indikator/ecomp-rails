class SiteController < ApplicationController
  def index
  end

  def login
    session[:user_id] = 1
    session[:user_role] = "User"
    redirect_to root_path
  end

  def logout
    session[:user_id] = nil
    session[:user_role] = nil
    redirect_to root_path
  end
end
