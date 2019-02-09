# frozen_string_literal: true

require 'hexlet/oop/version'
require 'net/http'
require 'json'

module Hexlet
  module Oop
    API_URL = 'http://ip-api.com/json/'.freeze
    SELF_IP_URL = URI('https://api.ipify.org')

    class Instruction
      def self.print
        puts 'jopa'
      end
    end

    class InformationGetter
      def initialize(ip:)
        @ip = ip
      end

      attr_accessor :ip, :http_client

      def get_info(http_client: Net::HTTP)
        request = Request.new(url: API_URL, ip: ip, http_client: http_client)
        request.perform
      end
    end

    class Request
      def initialize(url:, ip:, http_client:)
        @url = url
        @ip = ip
        @http_client = http_client
      end

      attr_accessor :url, :http_client, :ip

      def perform
        request_url = get_request_url(url, ip)
        http_client.get(request_url)
      end

      private

      def get_request_url(url, ip)
        request_ip = get_ip(ip)
        URI(url + request_ip)
      end

      def get_ip(ip)
        ip || get_self_ip
      end

      def get_self_ip
        http_client.get(SELF_IP_URL)
      end
    end
  end
end
