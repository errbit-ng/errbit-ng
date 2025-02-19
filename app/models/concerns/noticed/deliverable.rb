# frozen_string_literal: true

module Noticed
  module Deliverable
    extend ActiveSupport::Concern

    included do
      class_attribute :delivery_methods, instance_writer: false, default: {}
    end

    class_methods do
      def inherited(base)
        base.delivery_methods = delivery_methods.dup

        super
      end

      def deliver_by(name, options = {})
        # binding.pry

        raise NameError, "#{name} has already been used for this Notifier." if delivery_methods.has_key?(name)

        config = ActiveSupport::OrderedOptions.new.merge(options)
        yield config if block_given?
        delivery_methods[name] = DeliverBy.new(name, config)
      end

      def with(params)
        # binding.pry

        record = params.delete(:record)

        new(params: params, record: record)
      end

      def deliver(recipients = nil, **options)
        new.deliver(recipients, **options)
      end
      alias_method :deliver_later, :deliver
    end
  end
end
