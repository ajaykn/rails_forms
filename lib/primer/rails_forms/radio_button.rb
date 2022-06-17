# frozen_string_literal: true

module Primer
  module RailsForms
    class RadioButton < BaseComponent
      delegate :builder, :form, to: :@input

      def initialize(input:)
        @input = input
        @input.add_label_classes("FormControl-label")
        @input.add_input_classes(
          "FormControl",
          "mt-1"
        )
      end

      def nested_form_arguments
        return @nested_form_arguments if defined?(@nested_form_arguments)

        @nested_form_arguments = { **@input.nested_form_arguments }
        @nested_form_arguments[:class] = class_names(
          @nested_form_arguments[:class],
          @nested_form_arguments.delete(:classes),
          "ml-3"
        )

        @nested_form_arguments
      end
    end
  end
end
