require 'roar/representer'
require 'popit_representers/models/organization'
require 'popit_representers/representers/organization_representer'

module Popit
  module OrganizationCollectionRepresenter
    include Roar::Representer

    module Initializer
      def initialize
        extend Popit::OrganizationCollectionRepresenter
        extend Roar::Representer::Feature::Client
        super
      end
    end

    def self.included(klass)
      klass.send :prepend, Initializer
      klass.send :include, Roar::Representer::JSON::HAL
      klass.send :include, Roar::Representer::Feature::HttpVerbs
      klass.send :include, Roar::Representer::Feature::Hypermedia
    end

    collection :result, :extend => Popit::OrganizationRepresenter, :class => Popit::Organization

    def organizations
      self.result
    end
  end
end