require 'tko-aly-auth/query'
require 'tko-aly-auth/response'

module TKOaly
  module Auth

    def self.generic_question(username, role)
      auth_query = TKOaly::Auth::Query.new(username, role)
      response = auth_query.fetch
      auth_response = TKOaly::Auth::Response.new(response)
      auth_response.belongs?
    end

    def self.tarkisto_admin?(username)
      self.generic_question(username, 'ExamOfficer')
    end

  end
end
