require 'elastic_apm'

module ElasticAPM
  module Grape
    # ActiveSupport::Notifications.subscribe('endpoint_run.grape') do |name, started, finished, unique_id, payload|
    #   env = payload[:env]
    #   route_name = env['api.endpoint']&.routes&.first&.pattern&.origin || env['REQUEST_PATH']
    #   span_name = [env['REQUEST_METHOD'], route_name].join(' ')
    #   puts 'TEST HERE'
    #   if ElasticAPM.current_transaction
    #     ElasticAPM.current_transaction.name = span_name
    #   end
    # end

    # class ProcessGrapeNormalizer < ::ElasticAPM::Normalizers::Normalizer
    #   register 'endpoint_run.grape'
    #   TYPE = 'app.grape.request'.freeze
    #
    #   def normalize(transaction, _name, payload)
    #     env = payload[:env]
    #     route_name = env['api.endpoint']&.routes&.first&.pattern&.origin || env['REQUEST_PATH']
    #     span_name = [env['REQUEST_METHOD'], route_name].join(' ')
    #     [span_name, TYPE, nil]
    #   end
    # end
  end
end