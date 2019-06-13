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

  def markdown(text)
    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML,
                                       no_intra_emphasis: true,
                                       fenced_code_blocks: true,
                                       disable_indented_code_blocks: true,
                                       autolink: true,
                                       tables: true,
                                       underline: true,
                                       highlight: true)
    # rubocop:disable Rails/OutputSafety
    markdown.render(text).html_safe
    # rubocop:enable Rails/OutputSafety
  end
end
