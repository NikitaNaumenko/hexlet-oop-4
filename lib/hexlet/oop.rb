# frozen_string_literal: true

require 'hexlet/oop/version'
require 'net/http'
require 'json'

module Hexlet
  module Oop
    API_URL = 'http://ip-api.com/json/'.freeze

    class GeoIp
      def get_info(ip_address:, client: Net::HTTP)
        url = URI(API_URL + ip_address)
        result = client.get(url)
        JSON.parse(result)
      end
    end
  end
end
