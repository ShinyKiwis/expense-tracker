class PagesController < ApplicationController
  before_action :authenticate

  def dashboard
    @current_month_transactions_data = Transaction.where(date: Date.current.beginning_of_month..Date.current.end_of_month)
      .group_by_day(:date).sum(:amount)
      .reject { |date, sum_amount| sum_amount.zero? }
      .transform_keys { |date| "#{date.strftime("%A, %b")} #{date.day.ordinalize}" }
    @current_year_categories_data = Transaction.where(date: Date.current.beginning_of_year..Date.current.end_of_year).group(:category).sum(:amount)
    @total_categories_data = Transaction.group(:category).sum(:amount)
  end


  def expenses
    @transaction = Transaction.new
    @categories = Category.all
    respond_to do |format|
      format.html
      format.json { render json: TransactionDatatable.new(params) }
    end
  end

  def recent_expenses
    respond_to do |format|
      format.json { render json: TransactionDatatable.new(params) }
    end
  end

  def subscriptions
    @transaction = Transaction.new
    @categories = Category.all
    respond_to do |format|
      format.html
      format.json { render json: SubscriptionDatatable.new(params) }
    end
  end

  def monthly_subscriptions
    respond_to do |format|
      format.json { render json: TransactionDatatable.new(params) }
    end
  end

  def categories
    @category = Category.new
    @categories = Category.all
    respond_to do |format|
      format.html
      format.json { render json: CategoryDatatable.new(params) }
    end
  end

  private
  def authenticate
    redirect_to login_path if not current_user
  end
end
