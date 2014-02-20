require 'roar/representer'
require 'roar/representer/feature/http_verbs'
require 'roar/representer/feature/client'
require 'roar/representer/json/hal'

require 'popit_representers/models/personimage'
require 'popit_representers/models/personmembership'
require 'popit_representers/models/personlink'
require 'popit_representers/models/personcommission'
require 'popit_representers/models/personrepresent'
require 'popit_representers/models/personperiod'
require 'popit_representers/representers/personimage_representer'
require 'popit_representers/representers/personmembership_representer'
require 'popit_representers/representers/personlink_representer'
require 'popit_representers/representers/personcommission_representer'
require 'popit_representers/representers/personrepresent_representer'
require 'popit_representers/representers/personperiod_representer'

module Popit
  module PersonRepresenter
    include Roar::Representer::JSON::HAL

    module Initializer
      def initialize
        extend Popit::PersonRepresenter
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
    property :name
    property :slug
    property :data
    property :birth_date

    collection :images, extend: PersonimageRepresenter, class: Popit::Personimage
    collection :memberships, extend: PersonmembershipRepresenter, class: Popit::Personmembership
    collection :links, extend: PersonlinkRepresenter, class: Popit::Personlink
    collection :commissions, extend: PersoncommissionRepresenter, class: Popit::Personcommission
    collection :represent, extend: PersonrepresentRepresenter, class: Popit::Personrepresent
    collection :parliamentarian_period, extend: PersonperiodRepresenter, class: Popit::Personperiod

  end
end