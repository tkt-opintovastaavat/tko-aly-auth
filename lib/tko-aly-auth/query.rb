module TKOaly
  module Auth
    class Query

      attr_accessor :username, :role

      def initialize(username, role)
        @username = username
        @role = role
      end

    end
  end
end
