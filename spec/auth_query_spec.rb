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

end
