require 'pry'
class TransactionsController < ApplicationController

  def edit
    @transaction = Transaction.find(params[:id])
    @categories = Category.all
  end

  def update
    @transaction = Transaction.find(params[:id])
    if params[:commit] == 'Update'
      @transaction.update(description: transaction_params[:description], date: transaction_params[:date], category: transaction_params[:category], amount: transaction_params[:amount])
      if not Category.exists?(name: transaction_params[:category])
        Category.create(name: transaction_params[:category])
      end
      flash[:notice] = "Updated #{params[:ttype].downcase} #{params[:id]}!"
    else
      flash[:alert] = "Deleted #{params[:ttype].downcase} #{params[:id]}!"
      @transaction.destroy
    end

    binding.pry
    if params[:ttype] == "Expense"
      redirect_to expenses_path
    else
      redirect_to subscriptions_path
    end
  end

  def create
    transaction = Transaction.new
    transaction.description = transaction_params[:description]
    transaction.date = transaction_params[:date]
    transaction.amount = transaction_params[:amount]
    transaction.category = transaction_params[:category]
    if not Category.exists?(name: transaction.category)
      Category.create(name: transaction.category)
    end
    transaction.ttype = transaction_params[:ttype]
    if transaction.save
      if transaction_params[:ttype] == 'Expense'
        redirect_to expenses_path 
      else
        redirect_to subscriptions_path
      end
    end
  end

  private
  def transaction_params
    params.require(:transaction).permit(:description, :date, :amount, :category, :ttype)
  end
end
