require 'roar/representer'
require 'roar/representer/feature/http_verbs'
require 'roar/representer/feature/client'
require 'roar/representer/json/hal'

module Popit
  module PersoncontactRepresenter
    include Roar::Representer::JSON::HAL

    module Initializer
      def initialize
        extend Popit::PersoncontactRepresenter
        extend Roar::Representer::Feature::Client
        super
      end
    end

    def self.included(klass)
      klass.send :prepend, Initializer
      klass.send :include, Roar::Representer::Feature::HttpVerbs
    end

    property :id
    property :note
    property :type
    property :value
    property :label

  end
end
