require 'popit_representers/models/personimage'
require 'popit_representers/models/personmembership'
require 'popit_representers/representers/personimage_representer'
require 'popit_representers/representers/personmembership_representer'

module Popit
  class WrappedPerson
    include Roar::Representer::JSON::HAL
    include Roar::Representer::JSON
    include Roar::Representer::Feature::HttpVerbs

    def initialize
      extend Roar::Representer::Feature::Client
      super
    end

    self.representation_wrap = :result

    property :id
    property :name
    property :slug
    property :data

    collection :images, extend: PersonimageRepresenter, class: Popit::Personimage
    collection :memberships, extend: PersonmembershipRepresenter, class: Popit::Personmembership

  end
end