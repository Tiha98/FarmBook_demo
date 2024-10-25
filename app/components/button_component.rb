# frozen_string_literal: true

class ButtonComponent < ViewComponent::Base
    PRIMARY_CLASSES = [
      "mt-10",
      "block",
      "w-3/4",
      "rounded-md",
      "bg-indigo-600",
      "px-3.5",
      "py-2.5",
      "text-center",
      "text-sm",
      "font-semibold",
      "text-white",
      "shadow-sm",
      "hover:bg-indigo-500",
      "focus-visible:outline",
      "focus-visible:outline-2",
      "focus-visible:outline-offset-2",
      "focus-visible:outline-indigo-600"
    ].freeze
  
    SECONDARY_CLASSES = [
      "py-2.5",
      "px-5",
      "me-2",
      "mb-2",
      "text-sm",
      "font-medium",
      "text-gray-900",
      "focus:outline-none",
      "bg-white",
      "rounded-lg",
      "border",
      "border-gray-200",
      "hover:bg-gray-100",
      "hover:text-blue-700",
      "focus:z-10",
      "focus:ring-4",
      "focus:ring-gray-100",
      "dark:focus:ring-gray-700",
      "dark:bg-gray-800",
      "dark:text-gray-400",
      "dark:border-gray-600",
      "dark:hover:text-white",
      "dark:hover:bg-gray-700"
    ].freeze
  
    def initialize(text:, url:, button_type: :primary, custom_classes: [])
      @text = text
      @url = url
      @class_name = case button_type
                    when :primary
                      (PRIMARY_CLASSES + custom_classes).join(" ")
                    when :secondary
                      (SECONDARY_CLASSES + custom_classes).join(" ")
                    else
                      custom_classes.join(" ")
                    end
    end
  
    
  end