require 'roar/representer'
require 'roar/representer/feature/http_verbs'
require 'roar/representer/feature/client'
require 'roar/representer/json/hal'

require 'popit_representers/models/personlink'
require 'popit_representers/representers/personlink_representer'

module Popit
  module OrganizationRepresenter
    include Roar::Representer::JSON::HAL

    module Initializer
      def initialize
        extend Popit::OrganizationRepresenter
        extend Roar::Representer::Feature::Client
        super
      end
    end

    def self.included(klass)
      klass.send :prepend, Initializer
      klass.send :include, Roar::Representer::JSON
      klass.send :include, Roar::Representer::Feature::HttpVerbs
    end

    property :id
    property :founding_date
    property :name
    property :slug

    collection :links, extend: PersonlinkRepresenter, class: Popit::Personlink

  end
end