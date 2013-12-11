require 'roar/representer/json'
require 'representable/json/collection'
require 'representable/json/hash'
require 'popit_representers/representers/person_representer'

module Popit
  module PersonCollectionRepresenter
    include Roar::Representer
    include Roar::Representer::Feature::Hypermedia
    # include Representable::JSON::Collection

    module Initializer
      def initialize
        extend Popit::PersonCollectionRepresenter
        extend Roar::Representer::Feature::Client
        super
      end
    end

    def self.included(klass)
      klass.send :prepend, Initializer
      klass.send :include, Roar::Representer::JSON
      klass.send :include, Roar::Representer::Feature::HttpVerbs
      # klass.send :include, Representable::JSON::Collection
    end

    # items extend: PersonRepresenter, class: PopitPerson
    # self.representation_wrap= :result

    collection :result, :extend => PersonRepresenter, :class => PopitPerson

    def persons
      collect
    end
  end
end