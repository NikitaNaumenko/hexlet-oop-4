# frozen_string_literal: true

require 'hexlet/oop/version'
require 'net/http'
require 'json'

module Hexlet
  module Oop
    API_URL = 'ip-api.com'.freeze

    class GeoIp
      def initialize(client: Net::HTTP)
        @client = client
      end

      attr_reader :client

      def get_info(ip_address:, client: @client)
        url = URI::HTTP.build(host: API_URL, path: "/json/#{ip_address}")
        result = client.get(url)
        JSON.parse(result)
      end
    end
  end
end
