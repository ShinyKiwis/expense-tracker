module ApplicationHelper
  def full_title(page_title = '')
    base_title = 'Coiink'
    if !page_title.empty?
      base_title = "#{page_title} | Coiink"
    end
    base_title
  end

  def is_active_path?(current_path)
    current_path == request.path
  end
end
