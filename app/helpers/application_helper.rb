# frozen_string_literal: true

module ApplicationHelper
  def error_id(attribute)
    "#{attribute}-error"
  end

  def display_error(journey, attribute, margin: true)
    error = journey.errors[attribute].first
    return if error.blank?

    tag.span(id: error_id(attribute), class: "govuk-error-message #{'govuk-!-margin-top-3' if margin}") do
      error.to_s
    end
  end

  def form_group_with_error(model, attribute)
    css_classes = ['govuk-form-group']
    any_errors = model.errors.key?(attribute)
    css_classes += ['govuk-form-group--error'] if any_errors

    tag.div(class: css_classes, id: "#{attribute}-form-group") do
      yield(display_error(model, attribute), any_errors)
    end
  end
end
