class TransactionDatatable < AjaxDatatablesRails::ActiveRecord
  include ActionView::Helpers::NumberHelper
  include ActionView::Helpers::UrlHelper
  include Rails.application.routes.url_helpers

  def view_columns
    @view_columns ||= {
      id: { source: "Transaction.id", searchable: true, orderable: true },
      date: { source: "Transaction.date", searchable: true, orderable: true },
      description: { source: "Transaction.description", searchable: true, orderable: true },
      category: { source: "Transaction.category", searchable: true, orderable: true },
      amount: { source: "Transaction.amount", searchable: true, orderable: true }
    }
  end

  def data
    records.map do |record|
      {
        id: link_to(record.id, "/transactions/#{record.id}/edit", class: "transaction_link"),
        date: record.date.strftime("%d/%m/%Y"),
        description: record.description,
        category: record.category,
        amount: number_to_currency(record.amount, unit: "₫", precision: 0, format: "%n %u"),
      }
    end
  end

  def get_raw_records
    puts params
    case params[:action]
    when "recent_expenses"
      Transaction.where(ttype: "expense").where(date: Date.current.beginning_of_month..Date.current.end_of_month).order(date: :desc).limit(10)
    when "monthly_subscriptions"
      Transaction.where(ttype: "subscription").limit(10)
    else
      Transaction.where(ttype: "expense")
    end
  end
end
