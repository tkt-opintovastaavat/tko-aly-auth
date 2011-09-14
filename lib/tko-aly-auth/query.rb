module TKOaly
  module Auth
    class Query

      attr_accessor :username, :role

      def initialize(username, role)
        @username = username
        @role = role
      end

      def url
        "http://members.tko-aly.fi/externals/is#{@role}/#{@username}"
      end

    end
  end
end
