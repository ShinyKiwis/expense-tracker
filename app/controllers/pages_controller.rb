class PagesController < ApplicationController
  before_action :authenticate

  def dashboard
  end

  def expenses
    @transaction = Transaction.new
    @categories = Category.all
    respond_to do |format|
      format.html
      format.json { render json: TransactionDatatable.new(params) }
    end
  end

  def subscriptions
  end

  private
  def authenticate
    redirect_to login_path if not current_user
  end
end
