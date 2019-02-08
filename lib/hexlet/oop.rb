# frozen_string_literal: true

require 'hexlet/oop/version'
require 'net/http'

module Hexlet
  module Oop
    API_URL = 'http://ip-api.com/json/'.freeze

    class Instruction
      def self.print
        puts 'jopa'
      end
    end

    class IpAddress
      class << self
        def detect_ip_address(ip_address:)
          ip_address || detect_self_ip_address
        end

        private

        def detect_self_ip_address
          Net::HTTP.get URI 'https://api.ipify.org'
        end
      end
    end

    class Information
      def initialize(address:)
        @address = Hexlet::Oop::IpAddress.detect_ip_address(ip_address: address)
      end

      attr_accessor :address

      def get_info
        uri = URI(API_URL + address)
        result = Net::HTTP.get(uri)
        puts result
      end
    end
  end
end
