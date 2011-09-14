require 'spec_helper'

describe TKOaly::Auth::Response do

  before(:each) do
    @code = 200
    @username = 'foobar'
    @xml = "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<auth_response>\n\t<status>\n\t\t<code>0</code>\n\t\t<message>Komento suoritettu</message>\n\t</status>\n\t<user>\n\t\t<timestamp>1316037301</timestamp>\n\t\t<username>#{@username}</username>\n\t\t<isRandomRole>true</isRandomRole>\n\t</user>\n\t</auth_response>\n"
    @response = mock(Net::HTTPResponse)
    @response.stub!(:code).and_return(@code)
    @response.stub!(:body).and_return(@xml)
    @auth_response = TKOaly::Auth::Response.new @response
  end

  describe "creation" do

    it "should be created with HTTP-auth_response" do
      @auth_response.should_not be_nil
    end

  end

  describe "accessors" do

    it "should have code" do
      @auth_response.code.should == @code
    end

    it "should have username" do
      @auth_response.username.should == @username
    end

    it "should tell if username belongs to role" do
      @auth_response.belongs?(@username).should be_true
    end

  end

end
