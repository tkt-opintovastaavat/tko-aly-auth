require 'spec_helper'

describe TKOaly::Auth::Response do

  describe "creation" do

    it "should be created with HTTP-response" do
      request = Net::HTTPResponse.new 'foo', 'bar', 'baz'
      response = TKOaly::Auth::Response.new request
      response.should_not be_nil
    end

  end

end
