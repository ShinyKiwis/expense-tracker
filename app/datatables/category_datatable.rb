class CategoryDatatable < AjaxDatatablesRails::ActiveRecord
  include ActionView::Helpers::UrlHelper

  def view_columns
    @view_columns ||= {
      id: { source: "Category.id", searchable: true, orderable: true },
      name: { source: "Category.name", searchable: true, orderable: true}  
    }
  end

  def data
    records.map do |record|
      {
        id: link_to(record.id, "/categories/#{record.id}/edit", class: "transaction_link"),
        name: record.name
      }
    end
  end

  def get_raw_records
    Category.all
  end

end
