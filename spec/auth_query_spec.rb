require 'spec_helper'

describe TKOaly::Auth::Query do

  describe "creation" do

    it "should take username and role" do
      username = 'johndoe'
      role = 'randomrole'

      query = TKOaly::Auth::Query.new username, role
      query.username.should == username
      query.role.should == role
    end

  end

end
