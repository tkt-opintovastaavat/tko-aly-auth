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

  describe "tarkisto admin" do

    before(:each) do
      @tarkisto_admin_group = 'ExamOfficer'
    end

    it "should tell if user can administrate tarkisto" do
      valid_admin_user = 'saada'
      TKOaly::Auth.should_receive(:generic_question).with(valid_admin_user, @tarkisto_admin_group).and_return(true)
      TKOaly::Auth.tarkisto_admin?(valid_admin_user).should be_true
    end

    it "should tell if user can not administrate tarkisto" do
      invalid_admin_user = 'l33th4x0r'
      TKOaly::Auth.should_receive(:generic_question).with(invalid_admin_user, @tarkisto_admin_group).and_return(false)
      TKOaly::Auth.tarkisto_admin?(invalid_admin_user).should be_false
    end

  end

end
