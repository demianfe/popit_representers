require 'roar/representer'
require 'popit_representers/representers/person_representer'

module Popit
  module PersonCollectionRepresenter
    include Roar::Representer

    module Initializer
      def initialize
        extend Popit::PersonCollectionRepresenter
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

    property :total
    property :page
    property :per_page
    property :has_more
    property :next_url
    property :prev_url

    collection :result, :extend => PersonRepresenter, :class => PopitPerson

    def persons
      self.result
    end
  end
end