require 'roar/representer'
require 'roar/representer/feature/http_verbs'
require 'roar/representer/feature/client'
require 'roar/representer/json/hal'

module Popit
  module PersoncommissionRepresenter
    include Roar::Representer::JSON::HAL

    module Initializer
      def initialize
        extend Popit::PersoncommissionRepresenter
        extend Roar::Representer::Feature::Client
        super
      end
    end

    def self.included(klass)
      klass.send :prepend, Initializer
      klass.send :include, Roar::Representer::Feature::HttpVerbs
    end

    property :permanent
    property :special
    property :researcher

  end
end