module NavigationHelper
  def nav_link(name = nil, options = nil, condition = nil, html_options = nil, &block)
    html_options, condition, options = condition, options, name if block_given?
    options ||= {}

    path = options.is_a?(String) && options.start_with?('/') ? options[1..-1] : options
    if condition || (condition.nil? && current_page.path == path)
      html_options ||= { }
      html_options[:class] = '' unless html_options[:class]
      html_options[:class] << ' active'
    end

    content_tag(:li, html_options) do
      link_to(name, options, html_options, &block)
    end
  end
end
