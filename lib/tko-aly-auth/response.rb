require 'xml'

module TKOaly
  module Auth
    class Response

      attr_reader :code, :username

      def initialize(response)
        @code = response.code.to_i
        @username = parse_username(response)
      end

      def belongs?(username)
        @code == 200 and @username == username
      end

      private

      def parse_username(response)
        xml = XML::Document.string(response.body)
        user = xml.find('user').first
        username = user.find('username').first
        username.first.to_s #string
      end

    end
  end
end
