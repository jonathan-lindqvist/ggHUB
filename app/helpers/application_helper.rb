# frozen_string_literal: true

# Diffrent helper methods inolving the whole application
module ApplicationHelper
  # Returns the full title on a per-page basis.
  def full_title(page_title = '')
    base_title = 'ggHUB'
    if page_title.empty?
      base_title
    else
      page_title + ' | ' + base_title
    end
  end

  def current_class?(test_path)
    return 'active' if request.path == test_path

    ''
  end
end
