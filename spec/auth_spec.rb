require 'spec_helper'

describe TKOaly::Auth do

  describe "generic case" do

    before(:each) do
      @username = 'foobar'

      @auth_query_mock = mock(TKOaly::Auth::Query)
      TKOaly::Auth::Query.should_receive(:new).and_return(@auth_query_mock)

      @auth_response_mock = mock(TKOaly::Auth::Response)
      TKOaly::Auth::Response.should_receive(:new).and_return(@auth_response_mock)

      @auth_query_mock.stub!(:fetch).and_return(@auth_response_mock)
    end

    it "should tell when foobar belongs to RandomRole" do
      @role = 'RandomRole'
      @auth_response_mock.should_receive(:belongs?).and_return(true)
      TKOaly::Auth.generic_question(@username, @role).should be_true
    end

    it "should tell when foobar doesn't belong to StaticRole" do
      @role = 'StaticRole'
      @auth_response_mock.should_receive(:belongs?).and_return(false)
      TKOaly::Auth.generic_question(@username, @role).should be_false
    end

  end

end
