class SubscriptionDatatable < AjaxDatatablesRails::ActiveRecord
  include ActionView::Helpers::NumberHelper
  include ActionView::Helpers::UrlHelper
  
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
    Transaction.where(ttype: "subscription")
  end
end
