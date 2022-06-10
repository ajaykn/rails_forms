# frozen_string_literal: true

module Primer
  module RailsForms
    class RadioButton < BaseComponent
      def initialize(input:, builder:, form:, **system_arguments)
        @input = input
        @builder = builder
        @form = form
        @context = Context.new(input: input, builder: builder, **system_arguments)
        @context.add_input_classes("FormField-input")
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
