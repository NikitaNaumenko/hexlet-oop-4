# frozen_string_literal: true

require 'hexlet/oop/version'
require 'net/http'
require 'json'

module Hexlet
  module Oop
    API_URL = 'http://ip-api.com/json/'.freeze

    class GeoIp
      def initialize(client: Net::HTTP)
        @client = client
      end

      attr_reader :client

      def get_info(ip_address:)
        url = URI(API_URL + ip_address)
        result = client.get(url)
        JSON.parse(result)
      end
    end
  end
end
