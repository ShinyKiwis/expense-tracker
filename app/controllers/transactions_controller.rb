class TransactionsController < ApplicationController

  def edit
    @transaction = Transaction.find(params[:id])
  end

  def create
    transaction = Transaction.new
    transaction.description = transaction_params[:description]
    transaction.date = transaction_params[:date]
    transaction.amount = transaction_params[:amount]
    transaction.category = transaction_params[:category]
    if transaction.save
      redirect_to expenses_path
    end
  end

  private
  def transaction_params
    params.require(:transaction).permit(:description, :date, :amount, :category)
  end
end
