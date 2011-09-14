module TKOaly
  module Auth
    class Response

      attr_reader :code, :username

      def initialize(response)
        @code = response.code.to_i
      end

      def belongs?
        @code == 200
      end

    end
  end
end
