class TransactionsController < ApplicationController

  def edit
    @transaction = Transaction.find(params[:id])
    @categories = Category.all
  end

  def update
    @transaction = Transaction.find(params[:id])
    if params[:commit] == 'Update'
      @transaction.description = transaction_params[:description]
      @transaction.date = transaction_params[:date]
      @transaction.category = transaction_params[:category]
      @transaction.amount = transaction_params[:amount]
      if @transaction.save
        if not Category.exists?(name: transaction_params[:category])
          Category.create(name: transaction_params[:category])
        end
        flash[:notice] = "Updated #{transaction_params[:ttype].downcase} #{params[:id]}!"
      else
        flash[:alert] = @transaction.errors.full_messages
        return redirect_to edit_transaction_path(@transaction)
      end
    else
      flash[:alert] = "Deleted #{transaction_params[:ttype].downcase} #{params[:id]}!"
      @transaction.destroy
    end

    if transaction_params[:ttype] == "expense"
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
      flash[:notice] = "#{transaction_params[:ttype].capitalize} created!"
    else
      flash[:alert] = "#{transaction_params[:ttype].capitalize}: #{transaction.errors.full_messages.join(', ')}"
    end
    if transaction_params[:ttype] == 'expense'
      redirect_to expenses_path 
    else
      redirect_to subscriptions_path
    end
  end

  private
  def transaction_params
    params.require(:transaction).permit(:description, :date, :amount, :category, :ttype)
  end
end
