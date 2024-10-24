module ApplicationHelper
    def error_messages_for(attribute, errors)
      return if errors[attribute].empty?
        
      content_tag :div, class: "text-red-600" do
        content_tag :ul, class: "list-disc pl-5" do
          errors[attribute].map do |error|
            content_tag(:li) do
              "#{content_tag(:span, '•', class: 'text-red-600')} #{error}".html_safe
            end
          end.join.html_safe
        end
      end
    end
end