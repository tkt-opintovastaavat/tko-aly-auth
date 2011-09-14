require 'net/http'

module TKOaly
  module Auth
    class Query

      attr_reader :username, :role

      def initialize(username, role)
        @username = username
        @role = role
      end

      def url
        "http://members.tko-aly.fi/externals/is#{@role}/#{@username}"
      end

      def fetch
        uri = URI.parse(self.url)
        Net::HTTP.get_response(uri)
      end

    end
  end
end
