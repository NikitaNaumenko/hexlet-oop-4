# frozen_string_literal: true

require 'hexlet/oop/version'
require 'net/http'
require 'json'

module Hexlet
  module Oop
    API_URL = 'http://ip-api.com/json/'.freeze

    class Instruction
      def self.print
        puts 'jopa'
      end
    end

    class InformationGetter
      def initialize(entry_address, http_client: Net::HTTP)
        @entry_address = entry_address
        @http_client = http_client
      end

      attr_accessor :entry_address, :http_client

      def get_info
        address = Address.detect_address(address: entry_address, type: :ip)
        url = ApiUrl.new(url: API_URL, endpoint: address).get_api_url
        request = Request.new(url: url, http_client: http_client)

        puts request.perform
      end
    end

    class Address
      class << self
        def detect_address(address:, type: :ip)
          case type
          when :ip
            address || detect_self_ip_address
          end
        end

        private

        def detect_self_ip_address
          Net::HTTP.get URI 'https://api.ipify.org'
        end
      end
    end

    class ApiUrl
      def initialize(url: API_URL, endpoint:)
        @url = url
        @endpoint = endpoint
      end

      attr_accessor :url, :endpoint

      def get_api_url
        URI(url + endpoint)
      end
    end

    class Request
      def initialize(url:, http_client:)
        @url = url
        @http_client = http_client
      end

      attr_accessor :url, :http_client

      def perform
        http_client.get(url)
      end
    end
  end
end
