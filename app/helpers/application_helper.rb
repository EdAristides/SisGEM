module ApplicationHelper
    def bootstrap_class_for flash_type
        { success: "alert-success", error: "alert-danger", alert: "alert-warning", notice: "alert-info" }.stringify_keys[flash_type.to_s] || flash_type.to_s
      end
    
      def flash_messages(opts = {})
        flash.each do |msg_type, message|
          concat(content_tag(:div, message, class: "alert #{bootstrap_class_for(msg_type)}", role: "alert") do 
                  concat content_tag(:button, 'x', class: "close", data: { dismiss: 'alert' })
                  concat message 
                end)
        end
        nil
    end

    module BootstrapExtension
    FORM_CONTROL_CLASS = "form-control"

    # Override the 'text_field_tag' method defined in FormTagHelper[1]
    #
    # [1] https://github.com/rails/rails/blob/master/actionview/lib/action_view/helpers/form_tag_helper.rb
    def text_field_tag(name, value = nil, options = {})
      class_name = options[:class]
      if class_name.nil?
        # Add 'form-control' as the only class if no class was provided
        options[:class] = FORM_CONTROL_CLASS
      else
        # Add ' form-control' to the class if it doesn't already exist
        options[:class] << " #{FORM_CONTROL_CLASS}" if
          " #{class_name} ".index(" #{FORM_CONTROL_CLASS} ").nil?
      end

      # Call the original 'text_field_tag' method to do the real work
      super
    end
  end

  # Add the modified method to ApplicationHelper
  include BootstrapExtension

end
