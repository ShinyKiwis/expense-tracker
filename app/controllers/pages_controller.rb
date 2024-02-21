class PagesController < ApplicationController
  before_action :authenticate

  def dashboard
  end

  def expenses
  end

  def subscriptions
  end

  private
  def authenticate
    redirect_to login_path if not current_user
  end
end
