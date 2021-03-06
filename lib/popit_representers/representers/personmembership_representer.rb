require 'roar/representer'
require 'roar/representer/feature/http_verbs'
require 'roar/representer/feature/client'
require 'roar/representer/json/hal'

module Popit
  module PersonmembershipRepresenter
    include Roar::Representer::JSON::HAL

    module Initializer
      def initialize
        extend Popit::PersonmembershipRepresenter
        extend Roar::Representer::Feature::Client
        super
      end
    end

    def self.included(klass)
      klass.send :prepend, Initializer
      klass.send :include, Roar::Representer::Feature::HttpVerbs
    end

    property :id
    property :person_id
    property :role
    property :post_id
    property :label
    property :start_date
    property :end_date
    property :area_id
    property :area_name
    property :organization_id
    property :links
    property :contact_detail
    property :url

  end
end