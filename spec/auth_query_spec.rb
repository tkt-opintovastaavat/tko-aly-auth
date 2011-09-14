require 'spec_helper'

describe TKOaly::Auth::Query do

  before(:each) do
    @username = 'johndoe'
    @role = 'RandomRole'
    @query = TKOaly::Auth::Query.new @username, @role
  end

  describe "creation" do

    it "should have username" do
      @query.username.should == @username
    end

    it "should have role" do
      @query.role.should == @role
    end

  end

  describe "query formation" do

    it "should format query after username and role" do
      server = 'http://members.tko-aly.fi/'
      path = "externals/is#{@role}/#{@username}"
      @query.url.should == (server + path)
    end

  end

  describe "fetch query" do

    it "should fetch query and get response" do
      @fake_url = 'http://example.com/foo/bar'
      @fake_uri = URI.parse(@fake_url)
      @fake_response = Net::HTTPResponse.new 'foo', 'bar', 'baz'
      @query.should_receive(:url).and_return(@fake_url)

      Net::HTTP.should_receive(:get_response).with(@fake_uri).and_return(@fake_response)

      @response = @query.fetch

      @response.class.ancestors.should be_include(Net::HTTPResponse)
    end

  end

end
