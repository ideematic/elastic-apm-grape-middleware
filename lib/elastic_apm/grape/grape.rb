require 'elastic-apm'

module ElasticAPM
  module Grape
    class GrapeSpy
      NAME_FORMAT = 'present'.freeze
      TYPE = 'grape.present'.freeze

      def install
        ::Grape::DSL::InsideRoute.class_eval do
          alias present_without_apm present

          def present(*args)
            ElasticAPM.span NAME_FORMAT, TYPE do
              present_without_apm(args)
            end
          end
        end
      end
    end
    ::ElasticAPM::Spies.register(
      'Grape::DSL::InsideRoute',
      'grape',
      GrapeSpy.new
    )
  end
end
