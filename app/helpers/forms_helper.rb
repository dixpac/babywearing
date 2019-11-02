# frozen_string_literal: true

# View helpers for the forms
module FormsHelper
  # Used to render errors on the forms
  #
  # USAGE
  #   <%= form_errors @record %>
  #
  def form_errors(model)
    return unless model.errors.any?

    content_tag(:div, class: 'alert alert-danger', id: 'error_explanation') do
      content_tag(:ul) do
        sanitize model.errors.full_messages.map { |msg| content_tag(:li, msg) }.join
      end
    end
  end
end
